function [aeroForces] = paramSpace_12_1_4_1_1_2_1(sailStates,airStates)

	CL = (5.216301)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.077801)*sailStates.p + (34.412251)*sailStates.q + (2.117780)*sailStates.r + (0.011197)*sailStates.de;
	CD = -1.012540;
	CY = (-0.288026)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.894496)*sailStates.p + (-0.696927)*sailStates.q + (-0.125787)*sailStates.r + (-0.000148)*sailStates.de;

	Cl = (1.552672)*sailStates.alpha + (-0.419298)*sailStates.beta + (-0.787325)*sailStates.p + (6.873486)*sailStates.q + (1.811404)*sailStates.r + (-0.000363)*sailStates.de;
	Cm = (-12.844913)*sailStates.alpha + (0.000000)*sailStates.beta + (5.999576)*sailStates.p + (-121.395615)*sailStates.q + (-7.119120)*sailStates.r + (-0.067712)*sailStates.de;
	Cn = (1.054235)*sailStates.alpha + (0.058929)*sailStates.beta + (-1.898942)*sailStates.p + (8.756252)*sailStates.q + (0.027643)*sailStates.r + (0.000324)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end