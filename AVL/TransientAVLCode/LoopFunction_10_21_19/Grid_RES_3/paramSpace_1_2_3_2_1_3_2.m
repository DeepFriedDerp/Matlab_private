function [aeroForces] = paramSpace_1_2_3_2_1_3_2(sailStates,airStates)

	CL = (4.444749)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.454599)*sailStates.p + (31.866610)*sailStates.q + (0.345757)*sailStates.r + (0.010221)*sailStates.de;
	CD = -0.462850;
	CY = (-0.087704)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.412945)*sailStates.p + (-0.759371)*sailStates.q + (0.072741)*sailStates.r + (-0.000162)*sailStates.de;

	Cl = (1.413592)*sailStates.alpha + (-0.176175)*sailStates.beta + (-1.165746)*sailStates.p + (9.003664)*sailStates.q + (0.534713)*sailStates.r + (0.000381)*sailStates.de;
	Cm = (-15.761653)*sailStates.alpha + (0.000000)*sailStates.beta + (9.154743)*sailStates.p + (-136.489655)*sailStates.q + (-1.113224)*sailStates.r + (-0.068470)*sailStates.de;
	Cn = (0.426248)*sailStates.alpha + (-0.031064)*sailStates.beta + (-1.076793)*sailStates.p + (5.929368)*sailStates.q + (-0.059503)*sailStates.r + (0.000289)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end