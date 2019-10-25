function [aeroForces] = paramSpace_3_2_4_2_3_3_2(sailStates,airStates)

	CL = (4.384083)*sailStates.alpha + (0.103448)*sailStates.beta + (-2.600364)*sailStates.p + (36.159054)*sailStates.q + (1.154846)*sailStates.r + (0.011240)*sailStates.de;
	CD = -0.368500;
	CY = (0.098190)*sailStates.alpha + (-0.024620)*sailStates.beta + (0.450529)*sailStates.p + (0.769435)*sailStates.q + (-0.029448)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.257010)*sailStates.alpha + (-0.230859)*sailStates.beta + (-1.237329)*sailStates.p + (10.295085)*sailStates.q + (1.045725)*sailStates.r + (0.000405)*sailStates.de;
	Cm = (-13.889809)*sailStates.alpha + (-0.430009)*sailStates.beta + (8.615778)*sailStates.p + (-137.556381)*sailStates.q + (-3.956083)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (-0.010862)*sailStates.alpha + (0.016708)*sailStates.beta + (-0.949192)*sailStates.p + (3.373336)*sailStates.q + (-0.001450)*sailStates.r + (-0.000157)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end