function [aeroForces] = paramSpace_3_1_3_1_1_2_2(sailStates,airStates)

	CL = (4.188426)*sailStates.alpha + (0.141179)*sailStates.beta + (-2.529961)*sailStates.p + (34.804596)*sailStates.q + (0.777656)*sailStates.r + (0.010855)*sailStates.de;
	CD = -0.039870;
	CY = (-0.213583)*sailStates.alpha + (-0.026772)*sailStates.beta + (0.356251)*sailStates.p + (-1.693497)*sailStates.q + (-0.023409)*sailStates.r + (-0.000362)*sailStates.de;

	Cl = (1.483847)*sailStates.alpha + (-0.057443)*sailStates.beta + (-1.237022)*sailStates.p + (10.346358)*sailStates.q + (0.603417)*sailStates.r + (0.000430)*sailStates.de;
	Cm = (-14.709068)*sailStates.alpha + (-0.528111)*sailStates.beta + (8.493934)*sailStates.p + (-135.354233)*sailStates.q + (-2.623435)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (0.224490)*sailStates.alpha + (0.009409)*sailStates.beta + (-0.671019)*sailStates.p + (3.999203)*sailStates.q + (0.009804)*sailStates.r + (0.000530)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end