<!DOCTYPE html>
<html>
<head>
    <title>MindLink - ${pageTitle}</title>
    <!-- Link to static folder -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <!-- Tailwind or Bootstrap CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-50 flex">
    <!-- Include Sidebar -->
    <%@ include file="/WEB-INF/jsp/common/sidebar.jsp" %>
    
    <div class="main-content flex-1 p-8">