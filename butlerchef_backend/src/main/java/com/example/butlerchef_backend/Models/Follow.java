package com.example.butlerchef_backend.Models;


import javax.persistence.*;

@Entity
@Table
public class Follow {

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "follower_id", referencedColumnName = "id")
    private User userFollower;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "following_id", referencedColumnName = "id")
    private User userFollowing;

}
