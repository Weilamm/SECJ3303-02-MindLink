<%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <div class="page-header" style="margin-top: 40px;">
        <h2>Counselors</h2>
        <a href="${pageContext.request.contextPath}/admin/user-management/counselors/new" class="btn btn-teal">Add New
            Counselor</a>
    </div>

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
                            <td colspan="7" style="text-align: center; padding: 40px; color: #888;">No counselors found.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>