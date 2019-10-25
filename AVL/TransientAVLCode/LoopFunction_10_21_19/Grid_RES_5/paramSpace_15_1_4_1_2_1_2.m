function [aeroForces] = paramSpace_15_1_4_1_2_1_2(sailStates,airStates)

	CL = (4.196454)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.823364)*sailStates.p + (33.953438)*sailStates.q + (-0.074323)*sailStates.r + (0.009383)*sailStates.de;
	CD = -0.580090;
	CY = (-0.030337)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.369982)*sailStates.p + (0.476205)*sailStates.q + (0.092299)*sailStates.r + (0.000101)*sailStates.de;

	Cl = (1.538897)*sailStates.alpha + (0.166281)*sailStates.beta + (-1.515272)*sailStates.p + (12.330847)*sailStates.q + (-0.333064)*sailStates.r + (0.001050)*sailStates.de;
	Cm = (-14.645905)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.778167)*sailStates.p + (-148.858078)*sailStates.q + (0.026259)*sailStates.r + (-0.067973)*sailStates.de;
	Cn = (-0.183639)*sailStates.alpha + (-0.041459)*sailStates.beta + (1.193402)*sailStates.p + (-7.211181)*sailStates.q + (-0.120609)*sailStates.r + (-0.000258)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end