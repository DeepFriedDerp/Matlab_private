function [aeroForces] = paramSpace_2_2_2_2_2_2_1(sailStates,airStates)

	CL = (4.053687)*sailStates.alpha + (-0.175315)*sailStates.beta + (-2.351047)*sailStates.p + (34.514210)*sailStates.q + (1.048286)*sailStates.r + (0.010922)*sailStates.de;
	CD = -0.079990;
	CY = (0.035721)*sailStates.alpha + (-0.025707)*sailStates.beta + (0.333726)*sailStates.p + (0.513811)*sailStates.q + (-0.043899)*sailStates.r + (0.000109)*sailStates.de;

	Cl = (1.066312)*sailStates.alpha + (-0.230359)*sailStates.beta + (-0.996291)*sailStates.p + (8.103586)*sailStates.q + (0.844435)*sailStates.r + (-0.000007)*sailStates.de;
	Cm = (-13.502418)*sailStates.alpha + (0.699124)*sailStates.beta + (7.663916)*sailStates.p + (-130.467148)*sailStates.q + (-3.556809)*sailStates.r + (-0.068233)*sailStates.de;
	Cn = (0.091339)*sailStates.alpha + (0.025132)*sailStates.beta + (-0.650391)*sailStates.p + (2.149025)*sailStates.q + (-0.008466)*sailStates.r + (-0.000105)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end