using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InputManager : MonoBehaviour
{
    [SerializeField] private Rigidbody rb;
    private FloatingJoystick joystick;
    [SerializeField] private float moveSpeed;
    [SerializeField] private PlayerAnimator anim;
    public Transform player;
    private float inputX;
    private float inputZ;
    private Vector3 v_movement;
    public float toRotationSpeed;
    private void Start()
    {
        joystick = UIManager.ins.joystick;
    }

    private void FixedUpdate()
    {

        if(joystick.check)
        {
            anim.SetAnimRun(true);

            inputX = joystick.Horizontal;
            inputZ = joystick.Vertical;
            v_movement = new Vector3(inputX, 0, inputZ);
            v_movement.Normalize();
            player.Translate(v_movement * moveSpeed*Time.deltaTime,Space.World);
            if(v_movement!=Vector3.zero)
            {
                Quaternion toRotation = Quaternion.LookRotation(v_movement,Vector3.up);
                transform.rotation = Quaternion.Lerp(transform.rotation, toRotation, toRotationSpeed * Time.deltaTime);
            }    
        }

        else
        {
            anim.SetAnimRun(false);
        }
        
    }

}
