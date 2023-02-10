using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioManager Instance;
    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
    }
    public AudioSource door;
    private void Start()
    {
        door.enabled = false;
    }

    //public AudioClip clipdoor;
    public void onDoor()
    {
        door.enabled = true;
        door.Play();
    }


}
