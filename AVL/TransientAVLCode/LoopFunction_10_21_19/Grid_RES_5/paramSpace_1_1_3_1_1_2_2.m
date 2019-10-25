function [aeroForces] = paramSpace_1_1_3_1_1_2_2(sailStates,airStates)

	CL = (4.332356)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.825361)*sailStates.p + (33.832859)*sailStates.q + (0.092214)*sailStates.r + (0.009601)*sailStates.de;
	CD = -0.648810;
	CY = (0.036754)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.398629)*sailStates.p + (-0.476205)*sailStates.q + (0.099372)*sailStates.r + (-0.000101)*sailStates.de;

	Cl = (1.554830)*sailStates.alpha + (-0.180597)*sailStates.beta + (-1.516238)*sailStates.p + (12.325445)*sailStates.q + (0.380421)*sailStates.r + (0.001050)*sailStates.de;
	Cm = (-15.153666)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.804725)*sailStates.p + (-148.858078)*sailStates.q + (-0.132776)*sailStates.r + (-0.067973)*sailStates.de;
	Cn = (0.164512)*sailStates.alpha + (-0.045028)*sailStates.beta + (-1.237185)*sailStates.p + (7.232848)*sailStates.q + (-0.119390)*sailStates.r + (0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end