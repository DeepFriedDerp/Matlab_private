function [aeroForces] = paramSpace_3_2_3_2_1_1_3(sailStates,airStates)

	CL = (4.241858)*sailStates.alpha + (-0.039994)*sailStates.beta + (-2.934647)*sailStates.p + (37.070808)*sailStates.q + (-0.417180)*sailStates.r + (0.010980)*sailStates.de;
	CD = -0.301130;
	CY = (-0.149090)*sailStates.alpha + (-0.025317)*sailStates.beta + (-0.252984)*sailStates.p + (-0.870357)*sailStates.q + (0.016551)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.389807)*sailStates.alpha + (0.153034)*sailStates.beta + (-1.539703)*sailStates.p + (12.732381)*sailStates.q + (-0.494954)*sailStates.r + (0.000905)*sailStates.de;
	Cm = (-14.605586)*sailStates.alpha + (0.160943)*sailStates.beta + (10.233390)*sailStates.p + (-147.878265)*sailStates.q + (1.415260)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (0.109502)*sailStates.alpha + (-0.010865)*sailStates.beta + (0.691480)*sailStates.p + (-2.885341)*sailStates.q + (-0.006237)*sailStates.r + (0.000180)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end