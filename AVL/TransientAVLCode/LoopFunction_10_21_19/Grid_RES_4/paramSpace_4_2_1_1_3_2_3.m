function [aeroForces] = paramSpace_4_2_1_1_3_2_3(sailStates,airStates)

	CL = (3.439222)*sailStates.alpha + (0.054014)*sailStates.beta + (-3.382980)*sailStates.p + (42.198402)*sailStates.q + (0.888128)*sailStates.r + (0.011238)*sailStates.de;
	CD = 0.079590;
	CY = (0.139453)*sailStates.alpha + (-0.024015)*sailStates.beta + (0.040310)*sailStates.p + (1.002333)*sailStates.q + (-0.008126)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (1.235851)*sailStates.alpha + (-0.037804)*sailStates.beta + (-1.909642)*sailStates.p + (16.752327)*sailStates.q + (0.574893)*sailStates.r + (0.001638)*sailStates.de;
	Cm = (-12.711422)*sailStates.alpha + (-0.167475)*sailStates.beta + (11.510998)*sailStates.p + (-161.102386)*sailStates.q + (-2.990701)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-0.441776)*sailStates.alpha + (0.008227)*sailStates.beta + (0.205547)*sailStates.p + (-2.988899)*sailStates.q + (-0.079828)*sailStates.r + (-0.000261)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end