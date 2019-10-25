function [aeroForces] = paramSpace_2_1_1_1_2_1_2(sailStates,airStates)

	CL = (5.193770)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.030876)*sailStates.p + (44.684052)*sailStates.q + (-2.820952)*sailStates.r + (0.011666)*sailStates.de;
	CD = -1.046110;
	CY = (-0.035147)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.067436)*sailStates.p + (1.364609)*sailStates.q + (-0.227037)*sailStates.r + (0.000291)*sailStates.de;

	Cl = (2.054962)*sailStates.alpha + (0.479668)*sailStates.beta + (-1.572477)*sailStates.p + (15.167253)*sailStates.q + (-2.335917)*sailStates.r + (0.000915)*sailStates.de;
	Cm = (-11.844903)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.388041)*sailStates.p + (-146.890121)*sailStates.q + (9.346953)*sailStates.r + (-0.068730)*sailStates.de;
	Cn = (0.682165)*sailStates.alpha + (0.101956)*sailStates.beta + (2.087305)*sailStates.p + (-9.086103)*sailStates.q + (0.018086)*sailStates.r + (-0.000557)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end