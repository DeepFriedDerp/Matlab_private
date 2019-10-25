function [aeroForces] = paramSpace_4_1_4_1_3_1_2(sailStates,airStates)

	CL = (6.496973)*sailStates.alpha + (-0.348360)*sailStates.beta + (-2.339404)*sailStates.p + (26.879774)*sailStates.q + (-1.686921)*sailStates.r + (0.008792)*sailStates.de;
	CD = -2.500050;
	CY = (0.163091)*sailStates.alpha + (-0.018970)*sailStates.beta + (-1.054929)*sailStates.p + (1.664522)*sailStates.q + (0.210017)*sailStates.r + (0.000351)*sailStates.de;

	Cl = (2.466947)*sailStates.alpha + (0.349095)*sailStates.beta + (-1.177688)*sailStates.p + (8.247695)*sailStates.q + (-1.721642)*sailStates.r + (0.000566)*sailStates.de;
	Cm = (-17.794157)*sailStates.alpha + (1.260101)*sailStates.beta + (10.137126)*sailStates.p + (-136.195908)*sailStates.q + (5.416189)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (-0.828707)*sailStates.alpha + (-0.113105)*sailStates.beta + (2.576873)*sailStates.p + (-13.741573)*sailStates.q + (-0.123958)*sailStates.r + (-0.000698)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end