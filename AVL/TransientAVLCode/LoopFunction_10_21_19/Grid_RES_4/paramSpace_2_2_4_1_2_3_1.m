function [aeroForces] = paramSpace_2_2_4_1_2_3_1(sailStates,airStates)

	CL = (5.972418)*sailStates.alpha + (0.165732)*sailStates.beta + (-1.624218)*sailStates.p + (25.117498)*sailStates.q + (2.015601)*sailStates.r + (0.010164)*sailStates.de;
	CD = -2.265620;
	CY = (-0.405335)*sailStates.alpha + (-0.024921)*sailStates.beta + (1.032369)*sailStates.p + (-0.221995)*sailStates.q + (0.067642)*sailStates.r + (-0.000047)*sailStates.de;

	Cl = (1.189683)*sailStates.alpha + (-0.462115)*sailStates.beta + (-0.483456)*sailStates.p + (2.578888)*sailStates.q + (1.978900)*sailStates.r + (-0.000761)*sailStates.de;
	Cm = (-15.038868)*sailStates.alpha + (-0.680496)*sailStates.beta + (6.300992)*sailStates.p + (-112.898659)*sailStates.q + (-6.853099)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (2.024945)*sailStates.alpha + (-0.034351)*sailStates.beta + (-2.315805)*sailStates.p + (10.569583)*sailStates.q + (-0.020337)*sailStates.r + (0.000219)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end