function [aeroForces] = paramSpace_3_3_1_1_2_1_1(sailStates,airStates)

	CL = (5.972418)*sailStates.alpha + (0.165732)*sailStates.beta + (-1.624218)*sailStates.p + (25.117498)*sailStates.q + (-2.015601)*sailStates.r + (0.010164)*sailStates.de;
	CD = -2.265620;
	CY = (0.405335)*sailStates.alpha + (-0.025032)*sailStates.beta + (-1.032369)*sailStates.p + (0.221995)*sailStates.q + (0.067642)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.124455)*sailStates.alpha + (0.551443)*sailStates.beta + (-0.450805)*sailStates.p + (2.175012)*sailStates.q + (-1.980997)*sailStates.r + (-0.000847)*sailStates.de;
	Cm = (-15.038868)*sailStates.alpha + (-0.680495)*sailStates.beta + (6.300992)*sailStates.p + (-112.898659)*sailStates.q + (6.853097)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (-2.065108)*sailStates.alpha + (-0.032081)*sailStates.beta + (2.313665)*sailStates.p + (-10.543113)*sailStates.q + (-0.020199)*sailStates.r + (-0.000219)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end