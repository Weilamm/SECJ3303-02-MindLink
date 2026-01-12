<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Student List</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </head>

        <body>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
                <div class="container">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/user-management">User
                        Management</a>
                </div>
            </nav>

            <div class="container">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h2>Students</h2>
                    <a href="${pageContext.request.contextPath}/admin/user-management/students/new"
                        class="btn btn-success">Add New Student</a>
                </div>

                <c:if test="${not empty success}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${success}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <div class="card shadow-sm">
                    <div class="card-body p-0">
                        <table class="table table-striped table-hover mb-0">
                            <thead class="table-dark">
                                <tr>
                                    <th>Student ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Faculty</th>
                                    <th>Year</th>
                                    <th>Created At</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${students}" var="student">
                                    <tr>
                                        <td>${student.studentId}</td>
                                        <td>${student.name}</td>
                                        <td>${student.email}</td>
                                        <td>${student.faculty}</td>
                                        <td>${student.year}</td>
                                        <td>${student.createdAt != null ? student.createdAt : 'N/A'}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/admin/user-management/students/edit/${student.studentId}"
                                                class="btn btn-sm btn-outline-primary">Edit</a>
                                            <a href="${pageContext.request.contextPath}/admin/user-management/students/delete/${student.studentId}"
                                                class="btn btn-sm btn-outline-danger"
                                                onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty students}">
                                    <tr>
                                        <td colspan="7" class="text-center py-3">No students found.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </body>

        </html>