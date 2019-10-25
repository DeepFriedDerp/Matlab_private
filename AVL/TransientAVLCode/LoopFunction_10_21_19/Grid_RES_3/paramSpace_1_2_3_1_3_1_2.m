function [aeroForces] = paramSpace_1_2_3_1_3_1_2(sailStates,airStates)

	CL = (7.829193)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.611451)*sailStates.p + (42.489780)*sailStates.q + (-3.543899)*sailStates.r + (0.012251)*sailStates.de;
	CD = -3.022240;
	CY = (0.254097)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.481841)*sailStates.p + (1.671349)*sailStates.q + (-0.261130)*sailStates.r + (0.000355)*sailStates.de;

	Cl = (3.008221)*sailStates.alpha + (0.674237)*sailStates.beta + (-1.195727)*sailStates.p + (11.827006)*sailStates.q + (-3.011780)*sailStates.r + (0.000236)*sailStates.de;
	Cm = (-13.085241)*sailStates.alpha + (0.000001)*sailStates.beta + (6.507665)*sailStates.p + (-133.415192)*sailStates.q + (11.732946)*sailStates.r + (-0.068163)*sailStates.de;
	Cn = (-0.464141)*sailStates.alpha + (0.118886)*sailStates.beta + (3.154139)*sailStates.p + (-14.956518)*sailStates.q + (0.061898)*sailStates.r + (-0.000745)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end