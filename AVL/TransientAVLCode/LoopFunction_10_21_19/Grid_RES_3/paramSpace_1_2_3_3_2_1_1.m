function [aeroForces] = paramSpace_1_2_3_3_2_1_1(sailStates,airStates)

	CL = (4.239356)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.295214)*sailStates.p + (35.127678)*sailStates.q + (-1.438801)*sailStates.r + (0.011145)*sailStates.de;
	CD = -0.186010;
	CY = (0.027616)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.455575)*sailStates.p + (-0.173375)*sailStates.q + (-0.080347)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.175644)*sailStates.alpha + (0.234705)*sailStates.beta + (-0.981826)*sailStates.p + (8.453212)*sailStates.q + (-1.112265)*sailStates.r + (0.000003)*sailStates.de;
	Cm = (-13.302781)*sailStates.alpha + (0.000000)*sailStates.beta + (7.119087)*sailStates.p + (-128.476028)*sailStates.q + (4.785425)*sailStates.r + (-0.067684)*sailStates.de;
	Cn = (-0.210882)*sailStates.alpha + (0.041385)*sailStates.beta + (0.914046)*sailStates.p + (-3.652731)*sailStates.q + (-0.004603)*sailStates.r + (-0.000034)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end