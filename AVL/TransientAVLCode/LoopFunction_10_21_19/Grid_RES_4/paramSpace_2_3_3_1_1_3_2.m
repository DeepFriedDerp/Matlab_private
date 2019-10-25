function [aeroForces] = paramSpace_2_3_3_1_1_3_2(sailStates,airStates)

	CL = (7.294268)*sailStates.alpha + (-0.173929)*sailStates.beta + (-2.525846)*sailStates.p + (32.207996)*sailStates.q + (2.335243)*sailStates.r + (0.010523)*sailStates.de;
	CD = -2.827860;
	CY = (-0.196044)*sailStates.alpha + (-0.025520)*sailStates.beta + (1.255662)*sailStates.p + (-1.693494)*sailStates.q + (0.082241)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (2.666116)*sailStates.alpha + (-0.609924)*sailStates.beta + (-1.184042)*sailStates.p + (8.852620)*sailStates.q + (2.224736)*sailStates.r + (0.000339)*sailStates.de;
	Cm = (-17.397577)*sailStates.alpha + (0.687709)*sailStates.beta + (9.446370)*sailStates.p + (-137.990799)*sailStates.q + (-7.903647)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (0.784291)*sailStates.alpha + (-0.034671)*sailStates.beta + (-2.828105)*sailStates.p + (14.274652)*sailStates.q + (-0.034437)*sailStates.r + (0.000718)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end