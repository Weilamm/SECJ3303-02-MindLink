<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Initialize modules with sample data if not present
    List modules = (List) session.getAttribute("modules");
    if (modules == null) {
        modules = new ArrayList();
        
        // Sample Module 1: Introduction to Mental Health
        Map module1 = new HashMap();
        module1.put("id", "1");
        module1.put("title", "Introduction to Mental Health");
        module1.put("description", "Learn the basics of mental health, reduce stigma, and understand how emotional well-being affects your daily life and success.");
        module1.put("status", "active");
        module1.put("image", "images/mental-health-intro.jpg");
        
        List chapters1 = new ArrayList();
        
        // Chapter 1
        Map chapter1_1 = new HashMap();
        chapter1_1.put("id", "1");
        chapter1_1.put("title", "What is Mental Health?");
        List lessons1_1 = new ArrayList();
        
        Map lesson1_1_1 = new HashMap();
        lesson1_1_1.put("id", "1.1");
        lesson1_1_1.put("title", "Definition and Key Concepts");
        lessons1_1.add(lesson1_1_1);
        
        Map lesson1_1_2 = new HashMap();
        lesson1_1_2.put("id", "1.2");
        lesson1_1_2.put("title", "Mental Health vs Mental Illness");
        lessons1_1.add(lesson1_1_2);
        
        Map lesson1_1_3 = new HashMap();
        lesson1_1_3.put("id", "1.3");
        lesson1_1_3.put("title", "Mental Health Spectrum");
        lessons1_1.add(lesson1_1_3);
        
        chapter1_1.put("lessons", lessons1_1);
        chapters1.add(chapter1_1);
        
        // Chapter 2
        Map chapter1_2 = new HashMap();
        chapter1_2.put("id", "2");
        chapter1_2.put("title", "Mental Health Stigma");
        List lessons1_2 = new ArrayList();
        
        Map lesson1_2_1 = new HashMap();
        lesson1_2_1.put("id", "2.1");
        lesson1_2_1.put("title", "What is Stigma?");
        lessons1_2.add(lesson1_2_1);
        
        Map lesson1_2_2 = new HashMap();
        lesson1_2_2.put("id", "2.2");
        lesson1_2_2.put("title", "Media and Cultural Misconceptions");
        lessons1_2.add(lesson1_2_2);
        
        Map lesson1_2_3 = new HashMap();
        lesson1_2_3.put("id", "2.3");
        lesson1_2_3.put("title", "How to Challenge Stigma");
        lessons1_2.add(lesson1_2_3);
        
        chapter1_2.put("lessons", lessons1_2);
        chapters1.add(chapter1_2);
        
        module1.put("chapters", chapters1);
        modules.add(module1);
        
        // Sample Module 2: Stress Management
        Map module2 = new HashMap();
        module2.put("id", "2");
        module2.put("title", "Stress Management Techniques");
        module2.put("description", "Discover effective strategies to manage stress, build resilience, and maintain balance in your personal and professional life.");
        module2.put("status", "active");
        module2.put("image", "images/stress-management.jpg");
        
        List chapters2 = new ArrayList();
        
        // Chapter 1
        Map chapter2_1 = new HashMap();
        chapter2_1.put("id", "1");
        chapter2_1.put("title", "Understanding Stress");
        List lessons2_1 = new ArrayList();
        
        Map lesson2_1_1 = new HashMap();
        lesson2_1_1.put("id", "1.1");
        lesson2_1_1.put("title", "Types of Stress");
        lessons2_1.add(lesson2_1_1);
        
        Map lesson2_1_2 = new HashMap();
        lesson2_1_2.put("id", "1.2");
        lesson2_1_2.put("title", "Physical and Emotional Signs");
        lessons2_1.add(lesson2_1_2);
        
        chapter2_1.put("lessons", lessons2_1);
        chapters2.add(chapter2_1);
        
        // Chapter 2
        Map chapter2_2 = new HashMap();
        chapter2_2.put("id", "2");
        chapter2_2.put("title", "Coping Strategies");
        List lessons2_2 = new ArrayList();
        
        Map lesson2_2_1 = new HashMap();
        lesson2_2_1.put("id", "2.1");
        lesson2_2_1.put("title", "Mindfulness and Meditation");
        lessons2_2.add(lesson2_2_1);
        
        Map lesson2_2_2 = new HashMap();
        lesson2_2_2.put("id", "2.2");
        lesson2_2_2.put("title", "Time Management");
        lessons2_2.add(lesson2_2_2);
        
        Map lesson2_2_3 = new HashMap();
        lesson2_2_3.put("id", "2.3");
        lesson2_2_3.put("title", "Physical Exercise and Wellness");
        lessons2_2.add(lesson2_2_3);
        
        chapter2_2.put("lessons", lessons2_2);
        chapters2.add(chapter2_2);
        
        module2.put("chapters", chapters2);
        modules.add(module2);
        
        // Sample Module 3: Anxiety and Depression
        Map module3 = new HashMap();
        module3.put("id", "3");
        module3.put("title", "Understanding Anxiety and Depression");
        module3.put("description", "Learn to recognize symptoms, understand causes, and explore treatment options for anxiety and depression disorders.");
        module3.put("status", "active");
        module3.put("image", "images/anxiety-depression.jpg");
        
        List chapters3 = new ArrayList();
        
        // Chapter 1
        Map chapter3_1 = new HashMap();
        chapter3_1.put("id", "1");
        chapter3_1.put("title", "What is Anxiety?");
        List lessons3_1 = new ArrayList();
        
        Map lesson3_1_1 = new HashMap();
        lesson3_1_1.put("id", "1.1");
        lesson3_1_1.put("title", "Types of Anxiety Disorders");
        lessons3_1.add(lesson3_1_1);
        
        Map lesson3_1_2 = new HashMap();
        lesson3_1_2.put("id", "1.2");
        lesson3_1_2.put("title", "Recognizing Anxiety Symptoms");
        lessons3_1.add(lesson3_1_2);
        
        chapter3_1.put("lessons", lessons3_1);
        chapters3.add(chapter3_1);
        
        // Chapter 2
        Map chapter3_2 = new HashMap();
        chapter3_2.put("id", "2");
        chapter3_2.put("title", "Understanding Depression");
        List lessons3_2 = new ArrayList();
        
        Map lesson3_2_1 = new HashMap();
        lesson3_2_1.put("id", "2.1");
        lesson3_2_1.put("title", "Signs and Symptoms");
        lessons3_2.add(lesson3_2_1);
        
        Map lesson3_2_2 = new HashMap();
        lesson3_2_2.put("id", "2.2");
        lesson3_2_2.put("title", "Treatment Options");
        lessons3_2.add(lesson3_2_2);
        
        chapter3_2.put("lessons", lessons3_2);
        chapters3.add(chapter3_2);
        
        module3.put("chapters", chapters3);
        modules.add(module3);
        
        // Sample Module 4: Building Healthy Relationships (Draft)
        Map module4 = new HashMap();
        module4.put("id", "4");
        module4.put("title", "Building Healthy Relationships");
        module4.put("description", "Explore the foundations of healthy relationships, effective communication, and setting boundaries in personal and professional contexts.");
        module4.put("status", "draft");
        module4.put("image", "images/relationships.jpg");
        
        List chapters4 = new ArrayList();
        
        // Chapter 1
        Map chapter4_1 = new HashMap();
        chapter4_1.put("id", "1");
        chapter4_1.put("title", "Communication Skills");
        List lessons4_1 = new ArrayList();
        
        Map lesson4_1_1 = new HashMap();
        lesson4_1_1.put("id", "1.1");
        lesson4_1_1.put("title", "Active Listening");
        lessons4_1.add(lesson4_1_1);
        
        chapter4_1.put("lessons", lessons4_1);
        chapters4.add(chapter4_1);
        
        module4.put("chapters", chapters4);
        modules.add(module4);
        
        session.setAttribute("modules", modules);
    }
    
    // Handle CRUD operations
    String action = request.getParameter("action");
    
    if (action != null) {
        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String status = request.getParameter("status");
            String image = request.getParameter("image");
            
            Map newModule = new HashMap();
            newModule.put("id", String.valueOf(modules.size() + 1));
            newModule.put("title", title);
            newModule.put("description", description);
            newModule.put("status", status);
            newModule.put("image", image != null ? image : "images/default.jpg");
            newModule.put("chapters", new ArrayList());
            
            modules.add(newModule);
            session.setAttribute("modules", modules);
            response.sendRedirect("adminmodule.jsp");
            return;
        }
        else if ("update".equals(action)) {
            String moduleId = request.getParameter("moduleId");
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String status = request.getParameter("status");
            String image = request.getParameter("image");
            
            for (int i = 0; i < modules.size(); i++) {
                Map module = (Map) modules.get(i);
                if (module.get("id").equals(moduleId)) {
                    module.put("title", title);
                    module.put("description", description);
                    module.put("status", status);
                    if (image != null && !image.isEmpty()) {
                        module.put("image", image);
                    }
                    break;
                }
            }
            
            session.setAttribute("modules", modules);
            response.sendRedirect("adminmodule.jsp");
            return;
        }
        else if ("delete".equals(action)) {
            String moduleId = request.getParameter("moduleId");
            
            for (int i = 0; i < modules.size(); i++) {
                Map module = (Map) modules.get(i);
                if (module.get("id").equals(moduleId)) {
                    modules.remove(i);
                    break;
                }
            }
            
            session.setAttribute("modules", modules);
            response.sendRedirect("adminmodule.jsp");
            return;
        }
        else if ("addChapter".equals(action)) {
            String moduleId = request.getParameter("moduleId");
            String chapterTitle = request.getParameter("chapterTitle");
            
            for (int i = 0; i < modules.size(); i++) {
                Map module = (Map) modules.get(i);
                if (module.get("id").equals(moduleId)) {
                    List chapters = (List) module.get("chapters");
                    if (chapters == null) {
                        chapters = new ArrayList();
                        module.put("chapters", chapters);
                    }
                    
                    Map newChapter = new HashMap();
                    newChapter.put("id", String.valueOf(chapters.size() + 1));
                    newChapter.put("title", chapterTitle);
                    newChapter.put("lessons", new ArrayList());
                    
                    chapters.add(newChapter);
                    break;
                }
            }
            
            session.setAttribute("modules", modules);
            response.sendRedirect("adminmodule.jsp?editModule=" + moduleId);
            return;
        }
        else if ("deleteChapter".equals(action)) {
            String moduleId = request.getParameter("moduleId");
            String chapterId = request.getParameter("chapterId");
            
            for (int i = 0; i < modules.size(); i++) {
                Map module = (Map) modules.get(i);
                if (module.get("id").equals(moduleId)) {
                    List chapters = (List) module.get("chapters");
                    if (chapters != null) {
                        for (int j = 0; j < chapters.size(); j++) {
                            Map chapter = (Map) chapters.get(j);
                            if (chapter.get("id").equals(chapterId)) {
                                chapters.remove(j);
                                break;
                            }
                        }
                    }
                    break;
                }
            }
            
            session.setAttribute("modules", modules);
            response.sendRedirect("adminmodule.jsp?editModule=" + moduleId);
            return;
        }
        else if ("addLesson".equals(action)) {
            String moduleId = request.getParameter("moduleId");
            String chapterId = request.getParameter("chapterId");
            String lessonTitle = request.getParameter("lessonTitle");
            
            for (int i = 0; i < modules.size(); i++) {
                Map module = (Map) modules.get(i);
                if (module.get("id").equals(moduleId)) {
                    List chapters = (List) module.get("chapters");
                    if (chapters != null) {
                        for (int j = 0; j < chapters.size(); j++) {
                            Map chapter = (Map) chapters.get(j);
                            if (chapter.get("id").equals(chapterId)) {
                                List lessons = (List) chapter.get("lessons");
                                if (lessons == null) {
                                    lessons = new ArrayList();
                                    chapter.put("lessons", lessons);
                                }
                                
                                Map newLesson = new HashMap();
                                newLesson.put("id", chapterId + "." + (lessons.size() + 1));
                                newLesson.put("title", lessonTitle);
                                
                                lessons.add(newLesson);
                                break;
                            }
                        }
                    }
                    break;
                }
            }
            
            session.setAttribute("modules", modules);
            response.sendRedirect("adminmodule.jsp?editModule=" + moduleId);
            return;
        }
        else if ("deleteLesson".equals(action)) {
            String moduleId = request.getParameter("moduleId");
            String chapterId = request.getParameter("chapterId");
            String lessonId = request.getParameter("lessonId");
            
            for (int i = 0; i < modules.size(); i++) {
                Map module = (Map) modules.get(i);
                if (module.get("id").equals(moduleId)) {
                    List chapters = (List) module.get("chapters");
                    if (chapters != null) {
                        for (int j = 0; j < chapters.size(); j++) {
                            Map chapter = (Map) chapters.get(j);
                            if (chapter.get("id").equals(chapterId)) {
                                List lessons = (List) chapter.get("lessons");
                                if (lessons != null) {
                                    for (int k = 0; k < lessons.size(); k++) {
                                        Map lesson = (Map) lessons.get(k);
                                        if (lesson.get("id").equals(lessonId)) {
                                            lessons.remove(k);
                                            break;
                                        }
                                    }
                                }
                                break;
                            }
                        }
                    }
                    break;
                }
            }
            
            session.setAttribute("modules", modules);
            response.sendRedirect("adminmodule.jsp?editModule=" + moduleId);
            return;
        }
    }

    String adminUsername = (session.getAttribute("username") != null) 
        ? (String) session.getAttribute("username") 
        : "Admin123";
    
    String editModuleId = request.getParameter("editModule");
    Map editingModule = null;
    if (editModuleId != null && modules != null) {
        for (int i = 0; i < modules.size(); i++) {
            Map module = (Map) modules.get(i);
            if (module.get("id").equals(editModuleId)) {
                editingModule = module;
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindLink - Admin Module Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', 'DM Sans', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #fff5e6 0%, #ffe4cc 100%);
            min-height: 100vh;
            overflow-x: hidden;
            margin: 0;
            padding-top: 91px;
        }

        .container {
            max-width: 1254px;
            margin: 0 auto;
            position: relative;
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 91px;
            background: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            z-index: 100;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 50px;
            height: 100%;
        }

        .logo {
            font-size: 50px;
            font-weight: bold;
            color: #2c5f5d;
            letter-spacing: 0.5px;
            display: inline-flex;
            align-items: center;
            gap: 12px;
        }

        .logo-icon {
            width: 56px;
            height: 56px;
            object-fit: contain;
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;
        }

        .admin-badge {
            display: inline-block;
            background: #764ba2;
            color: white;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
            margin-left: 10px;
            vertical-align: middle;
        }

        nav {
            display: flex;
            gap: 40px;
            align-items: center;
        }

        .nav-link {
            color: #2c5f5d;
            text-decoration: none;
            font-size: 18px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #4ac1c0;
        }

        .nav-link.active {
            color: #4ac1c0;
            font-weight: 600;
        }

        .main-content {
            background: linear-gradient(135deg, #fff5e6 0%, #ffe4cc 100%);
            min-height: calc(100vh - 91px);
            padding: 40px 63px;
            position: relative;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-title {
            font-size: 36px;
            font-weight: bold;
            color: #102d47;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
        }

        .icon-btn {
            width: 45px;
            height: 45px;
            border-radius: 12px;
            border: 2px solid #e0e0e0;
            background: white;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 20px;
        }

        .icon-btn:hover {
            border-color: #4ac1c0;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(74, 193, 192, 0.3);
        }

        .learning-module {
            background: white;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 25px;
            display: flex;
            gap: 25px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .learning-module:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
        }

        .module-content-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .module-title {
            font-size: 26px;
            font-weight: bold;
            color: #102d47;
            margin-bottom: 12px;
            letter-spacing: -0.5px;
        }

        .module-description {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .module-actions {
            display: flex;
            gap: 12px;
            margin-top: auto;
            flex-wrap: wrap;
        }

        .module-btn {
            padding: 10px 20px;
            border-radius: 10px;
            border: none;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-edit {
            background: linear-gradient(135deg, #4ac1c0 0%, #2c5f5d 100%);
            color: white;
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(74, 193, 192, 0.4);
        }

        .btn-delete {
            background: #fff;
            color: #ff6b6b;
            border: 2px solid #ff6b6b;
        }

        .btn-delete:hover {
            background: #ff6b6b;
            color: white;
            transform: translateY(-2px);
        }

        .btn-view {
            background: #f8f9fa;
            color: #666;
            border: 2px solid #e0e0e0;
        }

        .btn-view:hover {
            background: #e9ecef;
            border-color: #ced4da;
        }

        .btn-manage {
            background: #667eea;
            color: white;
        }

        .btn-manage:hover {
            background: #5568d3;
            transform: translateY(-2px);
        }

        .status-badge {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .status-active {
            background: #d4edda;
            color: #155724;
        }

        .status-draft {
            background: #fff3cd;
            color: #856404;
        }

        .add-module-btn {
            position: fixed;
            bottom: 40px;
            right: 40px;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            font-size: 28px;
            cursor: pointer;
            box-shadow: 0 4px 20px rgba(102, 126, 234, 0.4);
            transition: all 0.3s ease;
            z-index: 50;
        }

        .add-module-btn:hover {
            transform: scale(1.1) rotate(90deg);
            box-shadow: 0 6px 30px rgba(102, 126, 234, 0.6);
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1000;
            justify-content: center;
            align-items: center;
            overflow-y: auto;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: white;
            border-radius: 20px;
            padding: 40px;
            max-width: 900px;
            width: 90%;
            max-height: 90vh;
            overflow-y: auto;
            margin: 20px;
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .modal-title {
            font-size: 28px;
            font-weight: bold;
            color: #102d47;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 32px;
            color: #666;
            cursor: pointer;
            transition: color 0.3s ease;
            line-height: 1;
        }

        .close-btn:hover {
            color: #102d47;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #666;
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-input,
        .form-textarea,
        .form-select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 16px;
            font-family: inherit;
            transition: border-color 0.3s ease;
        }

        .form-textarea {
            min-height: 120px;
            resize: vertical;
        }

        .form-input:focus,
        .form-textarea:focus,
        .form-select:focus {
            outline: none;
            border-color: #4ac1c0;
        }

        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            flex: 1;
            padding: 14px 20px;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: #e0e0e0;
            color: #666;
        }

        .btn-secondary:hover {
            background: #d0d0d0;
        }

        .no-modules {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }

        /* Content Management Styles */
        .content-section {
            background: white;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 25px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e0e0e0;
        }

        .content-title {
            font-size: 24px;
            font-weight: bold;
            color: #102d47;
        }

        .chapter-card {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            border-left: 4px solid #4ac1c0;
        }

        .chapter-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .chapter-title-text {
            font-size: 20px;
            font-weight: 600;
            color: #102d47;
        }

        .chapter-actions {
            display: flex;
            gap: 8px;
        }

        .btn-small {
            padding: 6px 12px;
            font-size: 12px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-add-lesson {
            background: #28a745;
            color: white;
        }

        .btn-add-lesson:hover {
            background: #218838;
        }

        .btn-delete-small {
            background: #dc3545;
            color: white;
        }

        .btn-delete-small:hover {
            background: #c82333;
        }

        .lesson-list {
            list-style: none;
            padding: 0;
        }

        .lesson-item-manage {
            background: white;
            padding: 12px 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .lesson-text {
            font-size: 14px;
            color: #333;
        }

        .btn-icon {
            background: none;
            border: none;
            font-size: 18px;
            cursor: pointer;
            padding: 5px;
            transition: transform 0.2s ease;
        }

        .btn-icon:hover {
            transform: scale(1.2);
        }

        .add-chapter-btn {
            background: linear-gradient(135deg, #4ac1c0 0%, #2c5f5d 100%);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .add-chapter-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(74, 193, 192, 0.4);
        }

        .back-to-list {
            background: #6c757d;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .back-to-list:hover {
            background: #5a6268;
        }

        .no-chapters {
            text-align: center;
            padding: 40px;
            color: #666;
            background: #f8f9fa;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="header-content">
                <h1 class="logo">
                    <img src="../images/mindlink.png" class="logo-icon" alt="Mindlink logo">Mindlink
                    <span class="admin-badge">ADMIN</span>
                </h1>
                <nav>
                    <a href="adminportal.jsp" class="nav-link">Home</a>
                    <a href="adminmodule.jsp" class="nav-link active">Module</a>
                    <a href="adminforum.jsp" class="nav-link">Forum</a>
                    <a href="adminprofile.jsp" class="nav-link">Profile</a>
                    <a href="admincontact.jsp" class="nav-link">Contact</a>
                </nav>
            </div>
        </header>

        <main class="main-content">
            <%
                if (editingModule != null) {
                    // Show content management view
                    String moduleTitle = (String) editingModule.get("title");
                    List chapters = (List) editingModule.get("chapters");
                    if (chapters == null) {
                        chapters = new ArrayList();
                        editingModule.put("chapters", chapters);
                    }
            %>
            
            <button class="back-to-list" onclick="window.location.href='adminmodule.jsp'">
                ← Back to Modules
            </button>

            <div class="content-section">
                <div class="content-header">
                    <h2 class="content-title">Managing: <%= moduleTitle %></h2>
                    <button class="add-chapter-btn" onclick="openAddChapterModal()">
                        + Add Chapter
                    </button>
                </div>

                <%
                    if (chapters.size() > 0) {
                        for (int i = 0; i < chapters.size(); i++) {
                            Map chapter = (Map) chapters.get(i);
                            String chapterId = (String) chapter.get("id");
                            String chapterTitle = (String) chapter.get("title");
                            List lessons = (List) chapter.get("lessons");
                %>
                
                <div class="chapter-card">
                    <div class="chapter-header">
                        <h3 class="chapter-title-text">Chapter <%= chapterId %>: <%= chapterTitle %></h3>
                        <div class="chapter-actions">
                            <button class="btn-small btn-add-lesson" onclick="openAddLessonModal('<%= chapterId %>')">
                                + Add Lesson
                            </button>
                            <button class="btn-small btn-delete-small" onclick="deleteChapter('<%= editModuleId %>', '<%= chapterId %>')">
                                Delete Chapter
                            </button>
                        </div>
                    </div>

                    <ul class="lesson-list">
                        <%
                            if (lessons != null && lessons.size() > 0) {
                                for (int j = 0; j < lessons.size(); j++) {
                                    Map lesson = (Map) lessons.get(j);
                                    String lessonId = (String) lesson.get("id");
                                    String lessonTitle = (String) lesson.get("title");
                        %>
                        <li class="lesson-item-manage">
                            <span class="lesson-text"><%= lessonId %> - <%= lessonTitle %></span>
                            <button class="btn-icon" onclick="deleteLesson('<%= editModuleId %>', '<%= chapterId %>', '<%= lessonId %>')" title="Delete">
                                🗑️
                            </button>
                        </li>
                        <%
                                }
                            } else {
                        %>
                        <li class="lesson-item-manage">
                            <span class="lesson-text" style="color: #999;">No lessons yet. Click "Add Lesson" to create one.</span>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
                
                <%
                        }
                    } else {
                %>
                <div class="no-chapters">
                    <h3>No Chapters Yet</h3>
                    <p>Click "Add Chapter" to create your first chapter.</p>
                </div>
                <%
                    }
                %>
            </div>

            <%
                } else {
                    // Show module list view
            %>
            
            <div class="page-header">
                <h1 class="page-title">Resources</h1>
                <div class="action-buttons">
                    <button class="icon-btn search" title="Search Modules">🔍</button>
                    <button class="icon-btn download" title="Export Modules">📥</button>
                    <button class="icon-btn edit" title="Bulk Edit">✏️</button>
                </div>
            </div>

            <%
                if (modules != null && modules.size() > 0) {
                    for (int i = 0; i < modules.size(); i++) {
                        Map module = (Map) modules.get(i);
                        String id = (String) module.get("id");
                        String title = (String) module.get("title");
                        String description = (String) module.get("description");
                        String status = (String) module.get("status");
                        String statusClass = "active".equals(status) ? "status-active" : "status-draft";
                        String statusText = "active".equals(status) ? "Active" : "Draft";
            %>
            
            <article class="learning-module" data-module-id="<%= id %>">
                <span class="status-badge <%= statusClass %>"><%= statusText %></span>
                <div class="module-content-wrapper">
                    <h2 class="module-title"><%= title %></h2>
                    <p class="module-description"><%= description %></p>
                    <div class="module-actions">
                        <button class="module-btn btn-edit" onclick="editModule('<%= id %>')">
                            Edit Module
                        </button>
                        <button class="module-btn btn-manage" onclick="manageContent('<%= id %>')">
                            Manage Content
                        </button>
                        <button class="module-btn btn-delete" onclick="deleteModule('<%= id %>')">
                            Delete
                        </button>
                    </div>
                </div>
            </article>
            
            <%
                    }
                } else {
            %>
                <div class="no-modules">
                    <h3>No modules available</h3>
                    <p>Click the + button below to add your first module.</p>
                </div>
            <%
                }
            %>
            
            <%
                }
            %>
        </main>

        <button class="add-module-btn" onclick="openAddModal()" title="Add New Module">+</button>
    </div>

    <!-- Edit Module Modal -->
    <div class="modal" id="moduleModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="modalTitle">Add New Module</h3>
                <button class="close-btn" onclick="closeModal('moduleModal')">×</button>
            </div>
            <form id="moduleForm" method="POST" action="adminmodule.jsp">
                <input type="hidden" id="moduleId" name="moduleId" value="">
                <input type="hidden" name="action" id="formAction" value="">
                
                <div class="form-group">
                    <label class="form-label" for="moduleTitle">Module Title</label>
                    <input type="text" class="form-input" id="moduleTitle" name="title" required>
                </div>

                <div class="form-group">
                    <label class="form-label" for="moduleDescription">Description</label>
                    <textarea class="form-textarea" id="moduleDescription" name="description" required></textarea>
                </div>

                <div class="form-group">
                    <label class="form-label" for="moduleStatus">Status</label>
                    <select class="form-select" id="moduleStatus" name="status" required>
                        <option value="active">Active</option>
                        <option value="draft">Draft</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label" for="moduleImage">Image URL</label>
                    <input type="text" class="form-input" id="moduleImage" name="image" placeholder="images/download.webp">
                </div>

                <div class="form-actions">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('moduleModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Module</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Add Chapter Modal -->
    <div class="modal" id="chapterModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Add New Chapter</h3>
                <button class="close-btn" onclick="closeModal('chapterModal')">×</button>
            </div>
            <form method="POST" action="adminmodule.jsp">
                <input type="hidden" name="action" value="addChapter">
                <input type="hidden" name="moduleId" value="<%= editModuleId %>">
                
                <div class="form-group">
                    <label class="form-label" for="chapterTitle">Chapter Title</label>
                    <input type="text" class="form-input" id="chapterTitle" name="chapterTitle" required placeholder="e.g., What is Mental Health?">
                </div>

                <div class="form-actions">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('chapterModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add Chapter</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Add Lesson Modal -->
    <div class="modal" id="lessonModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Add New Lesson</h3>
                <button class="close-btn" onclick="closeModal('lessonModal')">×</button>
            </div>
            <form method="POST" action="adminmodule.jsp">
                <input type="hidden" name="action" value="addLesson">
                <input type="hidden" name="moduleId" value="<%= editModuleId %>">
                <input type="hidden" id="lessonChapterId" name="chapterId" value="">
                
                <div class="form-group">
                    <label class="form-label" for="lessonTitle">Lesson Title</label>
                    <input type="text" class="form-input" id="lessonTitle" name="lessonTitle" required placeholder="e.g., Definition and Key Concepts">
                </div>

                <div class="form-actions">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('lessonModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add Lesson</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        const modules = [
            <%
                if (modules != null && modules.size() > 0) {
                    for (int i = 0; i < modules.size(); i++) {
                        Map module = (Map) modules.get(i);
                        String id = (String) module.get("id");
                        String title = ((String) module.get("title")).replace("\\", "\\\\").replace("'", "\\'").replace("\"", "\\\"");
                        String description = ((String) module.get("description")).replace("\\", "\\\\").replace("'", "\\'").replace("\"", "\\\"");
                        String status = (String) module.get("status");
            %>
            {
                id: '<%= id %>',
                title: '<%= title %>',
                description: '<%= description %>',
                status: '<%= status %>'
            }<%= (i < modules.size() - 1) ? "," : "" %>
            <%
                    }
                }
            %>
        ];

        function openAddModal() {
            document.getElementById('modalTitle').textContent = 'Add New Module';
            document.getElementById('moduleForm').reset();
            document.getElementById('moduleId').value = '';
            document.getElementById('formAction').value = 'add';
            document.getElementById('moduleModal').classList.add('active');
        }

        function editModule(id) {
            const module = modules.find(m => m.id === id);
            if (!module) return;

            document.getElementById('modalTitle').textContent = 'Edit Module';
            document.getElementById('moduleId').value = id;
            document.getElementById('moduleTitle').value = module.title;
            document.getElementById('moduleDescription').value = module.description;
            document.getElementById('moduleStatus').value = module.status;
            document.getElementById('formAction').value = 'update';
            document.getElementById('moduleModal').classList.add('active');
        }

        function manageContent(id) {
            window.location.href = 'adminmodule.jsp?editModule=' + id;
        }

        function viewModule(id) {
            window.location.href = 'questiondetail.jsp?module=' + id;
        }

        function deleteModule(id) {
            if (confirm('Are you sure you want to delete this module? This will also delete all chapters and lessons.')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'adminmodule.jsp';
                
                const actionInput = document.createElement('input');
                actionInput.type = 'hidden';
                actionInput.name = 'action';
                actionInput.value = 'delete';
                form.appendChild(actionInput);
                
                const moduleInput = document.createElement('input');
                moduleInput.type = 'hidden';
                moduleInput.name = 'moduleId';
                moduleInput.value = id;
                form.appendChild(moduleInput);
                
                document.body.appendChild(form);
                form.submit();
            }
        }

        function closeModal(modalId) {
            document.getElementById(modalId).classList.remove('active');
        }

        function openAddChapterModal() {
            document.getElementById('chapterModal').classList.add('active');
        }

        function openAddLessonModal(chapterId) {
            document.getElementById('lessonChapterId').value = chapterId;
            document.getElementById('lessonModal').classList.add('active');
        }

        function deleteChapter(moduleId, chapterId) {
            if (confirm('Are you sure you want to delete this chapter? All lessons will be removed.')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'adminmodule.jsp';
                
                const actionInput = document.createElement('input');
                actionInput.type = 'hidden';
                actionInput.name = 'action';
                actionInput.value = 'deleteChapter';
                form.appendChild(actionInput);
                
                const moduleInput = document.createElement('input');
                moduleInput.type = 'hidden';
                moduleInput.name = 'moduleId';
                moduleInput.value = moduleId;
                form.appendChild(moduleInput);
                
                const chapterInput = document.createElement('input');
                chapterInput.type = 'hidden';
                chapterInput.name = 'chapterId';
                chapterInput.value = chapterId;
                form.appendChild(chapterInput);
                
                document.body.appendChild(form);
                form.submit();
            }
        }

        function deleteLesson(moduleId, chapterId, lessonId) {
            if (confirm('Are you sure you want to delete this lesson?')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'adminmodule.jsp';
                
                const actionInput = document.createElement('input');
                actionInput.type = 'hidden';
                actionInput.name = 'action';
                actionInput.value = 'deleteLesson';
                form.appendChild(actionInput);
                
                const moduleInput = document.createElement('input');
                moduleInput.type = 'hidden';
                moduleInput.name = 'moduleId';
                moduleInput.value = moduleId;
                form.appendChild(moduleInput);
                
                const chapterInput = document.createElement('input');
                chapterInput.type = 'hidden';
                chapterInput.name = 'chapterId';
                chapterInput.value = chapterId;
                form.appendChild(chapterInput);
                
                const lessonInput = document.createElement('input');
                lessonInput.type = 'hidden';
                lessonInput.name = 'lessonId';
                lessonInput.value = lessonId;
                form.appendChild(lessonInput);
                
                document.body.appendChild(form);
                form.submit();
            }
        }

        // Close modal when clicking outside
        document.querySelectorAll('.modal').forEach(modal => {
            modal.addEventListener('click', function(e) {
                if (e.target === this) {
                    this.classList.remove('active');
                }
            });
        });

        // Prevent form submission on Enter key in input fields (except textarea)
        document.querySelectorAll('.form-input').forEach(input => {
            input.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>