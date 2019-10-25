function [aeroForces] = paramSpace_10_1_1_2_2_1_1(sailStates,airStates)

	CL = (4.224068)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.343504)*sailStates.p + (32.537384)*sailStates.q + (-0.330454)*sailStates.r + (0.010865)*sailStates.de;
	CD = -0.130270;
	CY = (0.081351)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.270699)*sailStates.p + (0.466416)*sailStates.q + (0.018880)*sailStates.r + (0.000100)*sailStates.de;

	Cl = (1.215333)*sailStates.alpha + (0.116502)*sailStates.beta + (-1.031843)*sailStates.p + (7.985601)*sailStates.q + (-0.405712)*sailStates.r + (0.000073)*sailStates.de;
	Cm = (-15.161612)*sailStates.alpha + (0.000000)*sailStates.beta + (8.223492)*sailStates.p + (-131.613632)*sailStates.q + (1.142542)*sailStates.r + (-0.069591)*sailStates.de;
	Cn = (-0.304223)*sailStates.alpha + (-0.008147)*sailStates.beta + (0.636616)*sailStates.p + (-3.291172)*sailStates.q + (-0.011331)*sailStates.r + (-0.000170)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end