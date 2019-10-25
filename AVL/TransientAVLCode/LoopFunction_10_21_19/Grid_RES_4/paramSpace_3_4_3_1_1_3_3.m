function [aeroForces] = paramSpace_3_4_3_1_1_3_3(sailStates,airStates)

	CL = (7.300964)*sailStates.alpha + (-0.675544)*sailStates.beta + (-3.472596)*sailStates.p + (44.631748)*sailStates.q + (3.116569)*sailStates.r + (0.011850)*sailStates.de;
	CD = -3.013450;
	CY = (0.273533)*sailStates.alpha + (-0.022540)*sailStates.beta + (1.442246)*sailStates.p + (-1.915493)*sailStates.q + (-0.094597)*sailStates.r + (-0.000416)*sailStates.de;

	Cl = (2.977870)*sailStates.alpha + (-0.844582)*sailStates.beta + (-1.880364)*sailStates.p + (16.546288)*sailStates.q + (2.771215)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-14.194156)*sailStates.alpha + (2.615986)*sailStates.beta + (10.953399)*sailStates.p + (-159.650192)*sailStates.q + (-10.548500)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-1.416307)*sailStates.alpha + (0.036082)*sailStates.beta + (-3.061498)*sailStates.p + (14.849217)*sailStates.q + (0.027141)*sailStates.r + (0.000840)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end