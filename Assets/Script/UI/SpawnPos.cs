using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnPos : MonoBehaviour
{
    // Start is called before the first frame update
    public GameObject posSpawn;
    public int num = 5;
    public float r = 1;

    // Update is called once per frame
    private void Start()
    {
        for(int i=0;i<num; i++)
        {
            float angle = i * Mathf.PI * 2 / num;
            float x = Mathf.Cos(angle) * r;
            float z = Mathf.Sin(angle) * r;
            Vector3 pos = transform.position + new Vector3(x, 0, z);
            float angleDegress = -angle * Mathf.Rad2Deg;
            Quaternion rot = Quaternion.Euler(0, angleDegress, 0);
            Instantiate(posSpawn, pos, rot);
        }    
    }
}
