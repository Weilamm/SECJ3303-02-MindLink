package com.mindlink.counseling;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CounselorService {

    private List<Counselor> counselors = new ArrayList<>();

    public CounselorService() {
        // 1. Ms. Tan Mei Ling (Exact data from screenshot)
        counselors.add(new Counselor(
            "mei-ling", 
            "Ms. Tan Mei Ling", 
            "Block A Room 117",
            "M.Sc. in Counseling",
            "Psychology, Universiti Malaya",
            "English, Malay, Mandarin",
            "tan.meiling@university.edu",
            "Ms. Tan Mei Ling is a professional counselor with over 8 years of experience working with university students. She specializes in academic stress management, motivation building, and emotional resilience.",
            "I believe every student has the capacity to grow. My counseling sessions focus on understanding personal challenges and finding realistic strategies.",
            "https://i.pravatar.cc/300?u=mei-ling" // Placeholder image URL
        ));

        // 2. Mr. Ryan Lin (Generic Data)
        counselors.add(new Counselor("ryan-lin", "Mr. Ryan Lin", "Block A Room 209", "M.A. Clinical Psychology", "Universiti Sains Malaysia", "English, Hokkien", "ryan.lin@university.edu", "Specializes in cognitive behavioral therapy.", "Change starts with a single step.", "https://i.pravatar.cc/300?u=ryan"));
        
        // 3. Ms. Nur Alya (Generic Data)
        counselors.add(new Counselor("nur-alya", "Ms. Nur Alya", "Block B Room 314", "PhD in Psychology", "UKM", "Malay, English", "nur.alya@university.edu", "Expert in anxiety and mood disorders.", "Mental health is just as important as physical health.", "https://i.pravatar.cc/300?u=alya"));
        
        // Add the rest of your list similarly...
        counselors.add(new Counselor("evelyn-reed", "Ms. Evelyn Reed", "Block A Room 301", "M.Sc. Counseling", "UPM", "English", "evelyn@uni.edu", "Focuses on adjustment issues.", "Talk to someone.", "https://i.pravatar.cc/300?u=evelyn"));
    }

    public List<Counselor> getAllCounselors() { return counselors; }

    // Search counselors by name keyword
    public List<Counselor> searchCounselors(String keyword) {
        if (keyword == null || keyword.isEmpty()) return counselors;
        return counselors.stream()
                .filter(c -> c.getName().toLowerCase().contains(keyword.toLowerCase()))
                .collect(Collectors.toList());
    }

    // Find specific counselor by ID
    public Counselor getCounselorById(String id) {
        return counselors.stream()
                .filter(c -> c.getId().equals(id))
                .findFirst()
                .orElse(null);
    }
}