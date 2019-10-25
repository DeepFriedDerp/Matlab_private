function [aeroForces] = paramSpace_2_3_3_2_3_3_2(sailStates,airStates)

	CL = (4.337126)*sailStates.alpha + (-0.049634)*sailStates.beta + (-2.532706)*sailStates.p + (33.795540)*sailStates.q + (0.478980)*sailStates.r + (0.010811)*sailStates.de;
	CD = -0.322430;
	CY = (0.094355)*sailStates.alpha + (-0.024729)*sailStates.beta + (0.284320)*sailStates.p + (0.769433)*sailStates.q + (0.018662)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.210165)*sailStates.alpha + (-0.183691)*sailStates.beta + (-1.178625)*sailStates.p + (9.278878)*sailStates.q + (0.564346)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-14.958017)*sailStates.alpha + (0.215208)*sailStates.beta + (8.894146)*sailStates.p + (-136.832825)*sailStates.q + (-1.644488)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (0.106798)*sailStates.alpha + (-0.011053)*sailStates.beta + (-0.723455)*sailStates.p + (2.897304)*sailStates.q + (-0.005452)*sailStates.r + (-0.000164)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end