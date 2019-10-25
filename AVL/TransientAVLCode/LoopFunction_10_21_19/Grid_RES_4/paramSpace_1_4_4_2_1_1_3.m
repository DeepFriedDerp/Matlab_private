function [aeroForces] = paramSpace_1_4_4_2_1_1_3(sailStates,airStates)

	CL = (4.143115)*sailStates.alpha + (0.404188)*sailStates.beta + (-2.949523)*sailStates.p + (41.721054)*sailStates.q + (-1.950022)*sailStates.r + (0.011520)*sailStates.de;
	CD = -0.358340;
	CY = (-0.164257)*sailStates.alpha + (-0.026093)*sailStates.beta + (-0.594632)*sailStates.p + (-0.455224)*sailStates.q + (-0.118329)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.214785)*sailStates.alpha + (0.441232)*sailStates.beta + (-1.463958)*sailStates.p + (13.208665)*sailStates.q + (-1.544486)*sailStates.r + (0.000763)*sailStates.de;
	Cm = (-11.949663)*sailStates.alpha + (-1.426616)*sailStates.beta + (8.966454)*sailStates.p + (-145.756409)*sailStates.q + (6.464807)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.459984)*sailStates.alpha + (0.064008)*sailStates.beta + (1.132238)*sailStates.p + (-3.916877)*sailStates.q + (-0.024257)*sailStates.r + (-0.000002)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end