<%@ page import="DAO.LoanLendingDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="business.InterestRate"%>
<%@ page import="business.LoanLending"%>
<%@ page import="DAO.InterestRateDAO"%> 

<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/checkLogin.jsp" %>

<%  InterestRateDAO interestRateDAO = new InterestRateDAO();
    LoanLendingDAO loanLendingDAO = new LoanLendingDAO();
    List<InterestRate> interestRates = interestRateDAO.listAll();
    request.setAttribute("interestRates", interestRates);
    String customerId = customer.getCustomerId();
%>                   

<div class="bg-[#f0f1f1] mt-[5.2rem] pb-16">
    <div class="py-16 mx-56">
        <div class="flex text-2xl">
            <a href="./index.jsp"
               ><i class="fa-solid fa-chevron-left text-xl py-[0.3rem] pr-6"></i></a>
            <div class="py-[0.2rem]">Loan Lending</div>
        </div>

        <nav class="flex pt-3 ml-[2.3rem]" aria-label="Breadcrumb">
            <ol class="inline-flex items-center space-x-1 md:space-x-3">
                <li class="inline-flex items-center">
                    <%@ include file="/includes/homeButton.jsp" %>
                </li>
                <li>
                    <div class="flex items-center">
                        <svg
                            class="w-3 h-3 mx-1"
                            aria-hidden="true"
                            xmlns="http://www.w3.org/2000/svg"
                            fill="none"
                            viewBox="0 0 6 10"
                            >
                            <path
                                stroke="currentColor"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="m1 9 4-4-4-4"
                                />
                        </svg>
                        <a
                            href="./loanLending.jsp"
                            class="ml-1 text-sm font-medium text-blue-600 md:ml-2 cursor-pointer"
                            >Loan Lending</a
                        >
                    </div>
                </li>
            </ol>
        </nav>
        <div class="my-16 py-8 px-20 rounded-xl bg-white">
            <div class="flex justify-between items-center">
                <span>Loan Lending</span>
                <button
                    id="createAccountBtn"
                    class="px-4 py-2 bg-[#00bfae] rounded-2xl outline-none 
                    focus:ring transform transition hover:scale-105 duration-300 ease-in-out flex text-white" onclick="showCreateAccount()"><img src="assets/plus.svg" src="" class="mr-2"></img>Add Loan</button>
            </div>
            <div>
                <c:if test="${not empty requestScope.successMessage}">
                    <p style="color: green">${requestScope.successMessage}</p>
                </c:if>

                <c:if test="${not empty requestScope.errorMessage}">
                    <p style="color: red">${requestScope.errorMessage}</p>
                </c:if>
            </div>
            <div class="grid grid-cols-1 gap-10 my-8">
                <%  List<LoanLending> loanLendings = loanLendingDAO.findLoanLendingByCusId(customerId);
                    if (loanLendings != null && !loanLendings.isEmpty()) {
                        for (LoanLending loanLending : loanLendings) {
                %>
                <a href="loan-detail?accountNumber=<%= loanLending.getAccountNumber()%>" class="flex justify-between p-4 rounded-xl bg-gray-300 
                   focus:ring transform transition hover:scale-105 duration-300 ease-in-out">
                    <div>
                        <i class="fa-regular fa-copy mr-2"></i>
                        <%= loanLending.getAccountNumber()%>
                    </div>
                    <div>
                        <span class="text-sm text-gray-600 mr-2">Interest Rate</span>
                        <%= loanLending.getInterestRate().getInterestRate()%> %
                    </div>
                    <i class="fa-solid fa-chevron-right py-1"></i>
                </a>       
                <%
                    }
                } else {
                %>
                <p class="text-center mt-5">No loan lendings found for the specified customer.</p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

<div
    id="create-account"
    class="create-account hidden fixed top-0 left-0 w-full h-full bg-blur z-[1000] px-96 py-28"
    >
    <div class="col-span-3 my-16 py-8 px-20 rounded-xl bg-white">
        <div class="text-[#2a6ebe] flex justify-between">
            Add Loan
            <button
                class="focus:ring transform transition hover:scale-125 duration-300 ease-in-out"
                onclick="closeCreateAccount()"
                >
                <i class="fa-solid fa-xmark"></i>
            </button>
        </div>
        <div class="content">
            <form action="create-loan-lending" method="post">
                <input type="hidden" name="action" value="create" />
                <div class="relative mt-6">
                    <input
                        type="text"
                        id="loanLendingNumber"
                        name="acNumber"
                        class="block pb-2.5 pt-4 w-full text-sm bg-transparent border-b-2 border-black appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        placeholder=" "
                        pattern="\d{9}"
                        title="Please enter a 9-digit number."
                        maxlength="9"
                        required
                        />
                    <label
                        for="loanLendingNumber"
                        class="absolute text-sm bg-white text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4"
                        >Loan Account Number (9 digits)</label
                    >
                </div>
                <div class="relative mt-6">
                    <input
                        type="text"
                        id="loanLending"
                        name="loanLending"
                        class="block pb-2.5 pt-4 w-full text-sm bg-transparent border-b-2 border-black appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        placeholder=" "
                        pattern="\d{7}"
                        title="Amount must be higher than 1000000."
                        maxlength="10"
                        required
                        />
                    <label
                        for="loanLending"
                        class="absolute text-sm bg-white text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4"
                        >Loan Lending</label
                    >
                </div>
                <div class="relative mt-6" >
					<select name="typeOfLoan" id="typeOfLoan" class="block pb-2.5 pt-4 w-full text-sm bg-transparent border-b-2 border-black appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer">
						<c:forEach var="rate" items="${interestRates}">
                            <option value="${rate.loanTitle}">
                                ${rate.loanTitle}
                            </option>
                        </c:forEach>
					</select>
					<label
                        for="typeOfLoan"
                        class="absolute text-sm bg-white text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4"
                        >Choose Type of Loan</label
                    >
                </div>
                <div class="flex justify-end items-center mt-10">
                    <button
                        class="px-16 py-3 rounded-md bg-gradient-to-r from-[#00bfae] to-[#0066ad] text-white"
                        >
                        Continue
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>