function [aeroForces] = paramSpace_3_4_3_1_1_2_2(sailStates,airStates)

	CL = (4.188426)*sailStates.alpha + (-0.141179)*sailStates.beta + (-2.529961)*sailStates.p + (34.804596)*sailStates.q + (0.777656)*sailStates.r + (0.010855)*sailStates.de;
	CD = -0.039870;
	CY = (-0.213583)*sailStates.alpha + (-0.022800)*sailStates.beta + (0.356251)*sailStates.p + (-1.693497)*sailStates.q + (-0.023409)*sailStates.r + (-0.000362)*sailStates.de;

	Cl = (1.335177)*sailStates.alpha + (-0.158621)*sailStates.beta + (-1.139329)*sailStates.p + (9.137800)*sailStates.q + (0.596971)*sailStates.r + (0.000171)*sailStates.de;
	Cm = (-14.709068)*sailStates.alpha + (0.528111)*sailStates.beta + (8.493934)*sailStates.p + (-135.354233)*sailStates.q + (-2.623435)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (0.262990)*sailStates.alpha + (0.004752)*sailStates.beta + (-0.677423)*sailStates.p + (4.078416)*sailStates.q + (0.010226)*sailStates.r + (0.000530)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end