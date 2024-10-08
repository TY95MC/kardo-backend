package ru.kardo.controller.request;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.kardo.dto.request.RequestPreviewDtoResponse;
import ru.kardo.dto.request.UserRequestDtoRequest;
import ru.kardo.dto.request.UserRequestDtoResponse;
import ru.kardo.model.User;
import ru.kardo.service.UserRequestService;
import ru.kardo.service.UserService;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("user/request")
@RequiredArgsConstructor
@Slf4j
@CrossOrigin(origins = {"http://localhost:3000", "https://kardo.zapto.org", "https://kardo-frontend.vercel.app", "http://51.250.32.102:8080"})
public class UserRequestController {

    private final UserService userService;
    private final UserRequestService userRequestService;

    @PostMapping("/{eventId}")
    public ResponseEntity<UserRequestDtoResponse> postUserRequest(Principal principal, @PathVariable Long eventId,
                                                                  @Valid @RequestBody UserRequestDtoRequest userRequestDtoRequest) {
        User user = userService.findUserByEmail(principal.getName());
        log.info("POST: /user/request/{} for {}", eventId, user.getEmail());
        return ResponseEntity.status(201).body(userRequestService.postUserRequest(user.getId(), eventId, userRequestDtoRequest));
    }

    @PostMapping("/grand-final-event/{eventId}")
    public ResponseEntity<UserRequestDtoResponse> postUserRequestToGrandFinaLEvent(Principal principal, @PathVariable Long eventId,
                                                                  @Valid @RequestBody UserRequestDtoRequest userRequestDtoRequest) {
        User user = userService.findUserByEmail(principal.getName());
        log.info("POST: /user/grand-final/request/{} for {}", eventId, user.getEmail());
        return ResponseEntity.status(201).body(userRequestService.postUserRequestToGrandFinalEvent(user.getId(), eventId, userRequestDtoRequest));
    }

    @PostMapping("/{eventId}/upload-preview")
    public ResponseEntity<RequestPreviewDtoResponse> uploadPreview(Principal principal, @PathVariable Long eventId,
                                                                   @RequestParam("file") @RequestPart MultipartFile multipartFile) throws IOException {
        User user = userService.findUserByEmail(principal.getName());
        log.info("POST: /user/request/{}/upload-preview for {}", eventId, user.getEmail());
        return ResponseEntity.status(201).body(userRequestService.uploadRequestPreview(user.getId(), eventId, multipartFile));
    }

    @PatchMapping("/{requestId}")
    public ResponseEntity<UserRequestDtoResponse> patchUserRequest(Principal principal, @PathVariable Long requestId,
                                                                   @Valid @RequestBody UserRequestDtoRequest userRequestDtoRequest) {
        User user = userService.findUserByEmail(principal.getName());
        log.info("PATCH: /user/request/{}", requestId);
        return ResponseEntity.ok().body(userRequestService.patchUserRequest(user.getId(), requestId, userRequestDtoRequest));
    }

    @GetMapping()
    public ResponseEntity<List<UserRequestDtoResponse>> getUserRequests(Principal principal) {
        User user = userService.findUserByEmail(principal.getName());
        log.info("GET: /user/request for {}", user.getEmail());
        return ResponseEntity.ok().body(userRequestService.getUserRequests(user.getId()));
    }
}
