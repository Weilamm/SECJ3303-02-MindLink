<%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <div class="page-header" style="margin-top: 40px;">
        <h2>Counselors</h2>
        <a href="${pageContext.request.contextPath}/admin/user-management/counselors/requests"
            class="btn btn-yellow">Approve Counselor Request</a>
    </div>

    <form method="get" action="${pageContext.request.contextPath}/admin/user-management/students"
        class="search-container" style="margin-bottom: 20px;">
        <input type="text" name="counselorSearch" placeholder="Search by Counselor ID or name..."
            value="${param.counselorSearch != null ? param.counselorSearch : ''}" class="search-input">
        <c:if test="${param.mainSearch != null && !param.mainSearch.isEmpty()}">
            <input type="hidden" name="search" value="${param.mainSearch}">
        </c:if>
        <button type="submit" class="search-button">Search</button>
        <c:if test="${param.counselorSearch != null && !param.counselorSearch.isEmpty()}">
            <a href="${pageContext.request.contextPath}/admin/user-management/students${param.mainSearch != null && !param.mainSearch.isEmpty() ? '?search=' : ''}${param.mainSearch != null && !param.mainSearch.isEmpty() ? param.mainSearch : ''}"
                class="clear-btn">Clear</a>
        </c:if>
    </form>

    <div class="card">
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Counselor ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Location</th>
                        <th>Specialization</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${counselors}" var="counselor">
                        <tr>
                            <td>${counselor.counselorId}</td>
                            <td>${counselor.name}</td>
                            <td>${counselor.email}</td>
                            <td>${counselor.phone}</td>
                            <td>${counselor.location}</td>
                            <td>${counselor.specialization}</td>
                            <td>
                                <span style="
                                        padding: 4px 12px; 
                                        border-radius: 12px; 
                                        font-size: 12px; 
                                        font-weight: 600;
                                        background-color: ${counselor.status == 'approved' ? '#d4edda' : (counselor.status == 'rejected' ? '#f8d7da' : '#fff3cd')};
                                        color: ${counselor.status == 'approved' ? '#155724' : (counselor.status == 'rejected' ? '#721c24' : '#856404')};
                                    ">
                                    ${counselor.status != null ? counselor.status : 'pending'}
                                </span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/user-management/counselors/edit/${counselor.counselorId}"
                                    class="btn btn-sm btn-yellow" style="margin-right: 5px;">Edit</a>
                                <a href="${pageContext.request.contextPath}/admin/user-management/counselors/delete/${counselor.counselorId}"
                                    class="btn btn-sm btn-pink"
                                    onclick="return confirm('Are you sure you want to delete this counselor?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty counselors}">
                        <tr>
                            <td colspan="8" style="text-align: center; padding: 40px; color: #888;">No approved
                                counselors found.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>