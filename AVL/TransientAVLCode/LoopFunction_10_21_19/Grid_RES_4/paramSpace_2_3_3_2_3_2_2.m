function [aeroForces] = paramSpace_2_3_3_2_3_2_2(sailStates,airStates)

	CL = (4.119444)*sailStates.alpha + (0.028976)*sailStates.beta + (-2.559038)*sailStates.p + (35.003204)*sailStates.q + (-0.530139)*sailStates.r + (0.011055)*sailStates.de;
	CD = 0.010280;
	CY = (0.096953)*sailStates.alpha + (-0.024729)*sailStates.beta + (-0.192527)*sailStates.p + (0.769435)*sailStates.q + (-0.012592)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.276642)*sailStates.alpha + (0.076509)*sailStates.beta + (-1.186955)*sailStates.p + (9.597726)*sailStates.q + (-0.379833)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-14.779166)*sailStates.alpha + (-0.093279)*sailStates.beta + (8.669951)*sailStates.p + (-136.832825)*sailStates.q + (1.776068)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (-0.093540)*sailStates.alpha + (0.004050)*sailStates.beta + (0.347260)*sailStates.p + (-1.967373)*sailStates.q + (0.002892)*sailStates.r + (-0.000255)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end