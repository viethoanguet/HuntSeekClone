using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InputManager : MonoBehaviour
{
    [SerializeField] private Rigidbody rb;
    [SerializeField] private FloatingJoystick joystick;
    [SerializeField] private float moveSpeed;
    [SerializeField] private PlayerAnimator anim;
    public Transform player;
    private float inputX;
    private float inputZ;
    private Vector3 v_movement;
    private Vector3 v_velocity;
    public float toRotationSpeed;

    // Start is called before the first frame update
    private void FixedUpdate()
    {

        if(joystick.check)
        {
            anim.SetAnimRun(true);

            //rb.rotation = rb.rotation * Quaternion.AngleAxis(joystick.Horizontal * moveSpeed, Vector3.up);
            //  v_movement = player.forward * joystick.Vertical;
            //   player.Rotate(Vector3.up * joystick.Horizontal * moveSpeed);
            // rb.velocity = new Vector3(joystick.Horizontal * moveSpeed, rb.velocity.y, joystick.Vertical * moveSpeed);
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
