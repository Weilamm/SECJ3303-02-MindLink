<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html>

            <head>
            <title>${student.studentId == null ? 'New' : 'Edit'} Student</title>
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
                    <div class="card shadow-sm col-md-8 mx-auto">
                        <div class="card-header">
                            <h3>${student.studentId == null ? 'New Student' : 'Edit Student'}</h3>
                        </div>
                        <div class="card-body">
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    ${error}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                </div>
                            </c:if>

                            <form action="${pageContext.request.contextPath}/admin/user-management/students/save"
                                method="post">
                                <input type="hidden" name="studentId" value="${student.studentId}" />
                                
                                <c:if test="${student.studentId != null && !empty student.studentId}">
                                    <div class="mb-3">
                                        <label class="form-label">Student ID</label>
                                        <input type="text" class="form-control" value="${student.studentId}" disabled />
                                        <small class="form-text text-muted">Student ID cannot be changed</small>
                                    </div>
                                </c:if>

                                <div class="mb-3">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" name="name" class="form-control" value="${student.name}"
                                        required />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control" value="${student.email}"
                                        required />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Password ${student.studentId != null ? '(Leave blank to
                                        keep current)' : ''}</label>
                                    <input type="password" name="password" class="form-control"
                                        ${student.studentId==null ? 'required' : '' } />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Phone</label>
                                    <input type="text" name="phone" class="form-control" value="${student.phone}" />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Faculty</label>
                                    <input type="text" name="faculty" class="form-control" value="${student.faculty}" />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Year</label>
                                    <input type="number" name="year" class="form-control" value="${student.year}" />
                                </div>

                                <div class="d-flex justify-content-between">
                                    <a href="${pageContext.request.contextPath}/admin/user-management/students"
                                        class="btn btn-secondary">Cancel</a>
                                    <button type="submit" class="btn btn-primary">Save Student</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </body>

            </html>