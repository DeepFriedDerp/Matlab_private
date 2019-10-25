function [aeroForces] = paramSpace_1_1_3_2_3_3_2(sailStates,airStates)

	CL = (4.134176)*sailStates.alpha + (0.048740)*sailStates.beta + (-2.397597)*sailStates.p + (31.851437)*sailStates.q + (-0.039142)*sailStates.r + (0.010072)*sailStates.de;
	CD = -0.266930;
	CY = (0.090591)*sailStates.alpha + (-0.026556)*sailStates.beta + (0.171776)*sailStates.p + (0.759371)*sailStates.q + (0.030361)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.245700)*sailStates.alpha + (-0.118328)*sailStates.beta + (-1.175195)*sailStates.p + (9.537692)*sailStates.q + (0.210836)*sailStates.r + (0.000400)*sailStates.de;
	Cm = (-14.989758)*sailStates.alpha + (-0.302144)*sailStates.beta + (8.635365)*sailStates.p + (-133.652283)*sailStates.q + (0.139915)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (0.163748)*sailStates.alpha + (-0.023900)*sailStates.beta + (-0.577840)*sailStates.p + (2.582196)*sailStates.q + (-0.028552)*sailStates.r + (-0.000180)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end