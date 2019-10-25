function [aeroForces] = paramSpace_1_2_1_2_2_1_1(sailStates,airStates)

	CL = (4.468821)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.180102)*sailStates.p + (35.214001)*sailStates.q + (-1.771735)*sailStates.r + (0.011096)*sailStates.de;
	CD = -0.481800;
	CY = (0.074467)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.645497)*sailStates.p + (-0.267956)*sailStates.q + (-0.113793)*sailStates.r + (-0.000057)*sailStates.de;

	Cl = (1.178232)*sailStates.alpha + (0.333435)*sailStates.beta + (-0.875652)*sailStates.p + (7.677786)*sailStates.q + (-1.469163)*sailStates.r + (-0.000178)*sailStates.de;
	Cm = (-12.225263)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.437833)*sailStates.p + (-124.628265)*sailStates.q + (5.937986)*sailStates.r + (-0.067322)*sailStates.de;
	Cn = (-0.504763)*sailStates.alpha + (0.058794)*sailStates.beta + (1.337902)*sailStates.p + (-5.354841)*sailStates.q + (0.003793)*sailStates.r + (-0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end