<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/includes/header.jsp" %> <%@ include
    file="/includes/checkLogin.jsp" %>
    <div class="bg-[#f0f1f1] mt-[5.2rem] pb-16">
        <div class="py-16 mx-2 md:mx-56">
            <div class="flex text-2xl">
                <a href=""
                   ><i class="fa-solid fa-chevron-left text-xl py-[0.3rem] pr-6"></i
                    ></a>
                <div class="py-[0.2rem]">Transfer</div>
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
                            <form class="cursor-pointer">
                                <button
                                    type="text"
                                    class="ml-1 text-sm font-medium text-blue-600 md:ml-2 mb-1 pointer-events-none"
                                    >
                                    Transfer
                                </button>
                            </form>
                        </div>
                    </li>
                </ol>
            </nav>
            <div class="flex flex-col md:grid grid-cols-5 md:gap-8">
                <div class="relative col-span-3 my-16 py-8 px-8 md:px-20 rounded-xl bg-white">
                    <span class="text-[#2a6ebe]">Internal Transfer</span>
                    <div class="my-2">
                        <c:if test="${not empty requestScope.successMessage}">
                            <div
                                class="flex items-center p-4 mb-4 text-sm text-green-800 rounded-lg bg-green-100"
                                role="alert"
                                >
                                <svg
                                    class="flex-shrink-0 inline w-4 h-4 me-3"
                                    aria-hidden="true"
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="currentColor"
                                    viewBox="0 0 20 20"
                                    >
                                    <path
                                        d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"
                                        />
                                </svg>
                                <span class="sr-only">Info</span>
                                <div>
                                    <span class="font-medium">${requestScope.successMessage}</span>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${not empty requestScope.errorMessage}">
                            <div
                                class="flex items-center p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-100"
                                role="alert"
                                >
                                <svg
                                    class="flex-shrink-0 inline w-4 h-4 me-3"
                                    aria-hidden="true"
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="currentColor"
                                    viewBox="0 0 20 20"
                                    >
                                    <path
                                        d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"
                                        />
                                </svg>
                                <span class="sr-only">Info</span>
                                <div>
                                    <span class="font-medium">${requestScope.errorMessage}</span>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <form action="Transfer" method="post">
                        <input type="hidden" name="action" value="add" />
                        <div class="relative mt-6">
                            <input
                                type="text"
                                id="accountNumber"
                                name="acNumber"
                                class="block px-2.5 pb-2.5 pt-4 w-full text-sm bg-transparent rounded-lg border-2 border-black appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder=" "
                                pattern="\d{10}"
                                title="Please enter a 10-digit number."
                                maxlength="10"
                                value="${Number}"
                                required
                                />
                            <label
                                for="accountNumber"
                                class="absolute text-sm bg-white text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] px-2 peer-focus:px-2 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1"
                                >Account Number</label
                            >
                        </div>
                        <div class="relative mt-8">
                            <input
                                type="text"
                                id="name"
                                name="acName"
                                class="block px-2.5 pb-2.5 pt-4 w-full text-sm bg-transparent rounded-lg border-2 border-black appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder=" "
                                value="${receiver.getCustomer().getName()}"
                                readonly
                                />

                            <label
                                for="name"
                                class="absolute text-sm bg-white text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] px-2 peer-focus:px-2 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1"
                                >Account Name</label
                            >
                        </div>
                        <div class="relative mt-8">
                            <input
                                type="text"
                                id="amount"
                                name="acAmount"
                                class="block px-2.5 pb-2.5 pt-4 w-full text-sm bg-transparent rounded-lg border-2 border-black appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder=" "
                                value="${Amount}"
                                />
                            <label
                                for="amount"
                                class="absolute text-sm bg-white text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] px-2 peer-focus:px-2 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1"
                                >Amount</label
                            >
                        </div>
                        <div class="relative mt-8">
                            <input
                                type="text"
                                id="transactionRemark"
                                name="transRemark"
                                class="block px-2.5 pb-2.5 pt-4 w-full text-sm bg-transparent rounded-lg border-2 border-black appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                value="<%= customer.getName()%> Chuyển tiền"
                                />
                            <label
                                for="transactionRemark"
                                class="absolute text-sm bg-white text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] px-2 peer-focus:px-2 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1"
                                >Transaction Remark</label
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
                    <form id="showName" action="Transfer" method="post" class="absolute top-44 right-14 md:right-24 z-[1000]">
                        <input type="hidden" name="action" value="show-name" />
                        <input type="hidden" name="getNumber" id="getNumber" />
                        <input type="hidden" name="getAmount" id="getAmount" />
                        <div>
                            <button
                                onclick="setAcNumber()"
                                type="text"
                                class="ml-1 text-sm font-medium text-blue-600 md:ml-2 mb-1"
                                >
                                Check
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-span-2 md:my-16 p-8 rounded-xl bg-white">
                    <div
                        class="w-full text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700"
                        >
                        <ul class="grid grid-cols-3">
                            <li class="">
                                <a
                                    href="#"
                                    class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300"
                                    >Contacts</a
                                >
                            </li>
                            <li class="">
                                <a
                                    href="#"
                                    class="inline-block p-4 text-blue-600 border-b-2 border-blue-600 rounded-t-lg active"
                                    aria-current="page"
                                    >Recent</a
                                >
                            </li>
                            <li class="">
                                <a
                                    href="#"
                                    class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300"
                                    >Saved</a
                                >
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function setAcNumber() {
            const numberValue = document.getElementById('accountNumber').value;
            const amountValue = document.getElementById('amount').value;
            document.getElementById("getNumber").value = numberValue;
            document.getElementById("getAmount").value = amountValue;
            document.getElementById('showName').submit();
        }
    </script>
    <%@ include file="/includes/footer.jsp" %>
