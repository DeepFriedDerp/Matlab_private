function [aeroForces] = paramSpace_2_4_4_2_3_3_3(sailStates,airStates)

	CL = (4.224648)*sailStates.alpha + (-0.163473)*sailStates.beta + (-2.915673)*sailStates.p + (36.771473)*sailStates.q + (0.438316)*sailStates.r + (0.010874)*sailStates.de;
	CD = -0.327960;
	CY = (0.153351)*sailStates.alpha + (-0.024133)*sailStates.beta + (0.283533)*sailStates.p + (0.870358)*sailStates.q + (0.018676)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.272436)*sailStates.alpha + (-0.204041)*sailStates.beta + (-1.465602)*sailStates.p + (11.850179)*sailStates.q + (0.549291)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.506805)*sailStates.alpha + (0.758703)*sailStates.beta + (10.173846)*sailStates.p + (-146.834106)*sailStates.q + (-1.532184)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (-0.104533)*sailStates.alpha + (-0.010394)*sailStates.beta + (-0.732242)*sailStates.p + (2.857114)*sailStates.q + (-0.006159)*sailStates.r + (-0.000203)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end