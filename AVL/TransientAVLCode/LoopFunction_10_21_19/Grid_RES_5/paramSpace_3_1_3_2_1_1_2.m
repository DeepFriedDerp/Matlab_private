function [aeroForces] = paramSpace_3_1_3_2_1_1_2(sailStates,airStates)

	CL = (4.038898)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.758440)*sailStates.p + (38.619324)*sailStates.q + (-1.388683)*sailStates.r + (0.011237)*sailStates.de;
	CD = -0.077780;
	CY = (-0.070684)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.399675)*sailStates.p + (-0.261303)*sailStates.q + (-0.070483)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.285516)*sailStates.alpha + (0.210261)*sailStates.beta + (-1.363641)*sailStates.p + (11.946960)*sailStates.q + (-1.072044)*sailStates.r + (0.000636)*sailStates.de;
	Cm = (-13.239184)*sailStates.alpha + (0.000000)*sailStates.beta + (8.804563)*sailStates.p + (-141.841248)*sailStates.q + (4.643278)*sailStates.r + (-0.069021)*sailStates.de;
	Cn = (0.235284)*sailStates.alpha + (0.037075)*sailStates.beta + (0.712829)*sailStates.p + (-2.279217)*sailStates.q + (-0.020955)*sailStates.r + (0.000002)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end