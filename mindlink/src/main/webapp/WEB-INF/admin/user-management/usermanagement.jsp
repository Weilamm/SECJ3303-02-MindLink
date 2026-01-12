<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>User Management Dashboard</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body class="bg-light">
            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-8 text-center">
                        <h1 class="mb-4">User Management System</h1>
                        <div class="card shadow-sm">
                            <div class="card-body p-5">
                                <p class="lead mb-4">Manage student users:</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                                    <a href="${pageContext.request.contextPath}/admin/user-management/students"
                                        class="btn btn-primary btn-lg px-4 gap-3">Manage Students</a>
                                </div>
                            </div>
                        </div>
                        <div class="mt-4">
                            <a href="${pageContext.request.contextPath}/" class="text-muted">Return to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>