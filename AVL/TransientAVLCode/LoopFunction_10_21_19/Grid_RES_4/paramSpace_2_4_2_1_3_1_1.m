function [aeroForces] = paramSpace_2_4_2_1_3_1_1(sailStates,airStates)

	CL = (7.277118)*sailStates.alpha + (0.643246)*sailStates.beta + (-1.703281)*sailStates.p + (30.295874)*sailStates.q + (-2.882942)*sailStates.r + (0.010992)*sailStates.de;
	CD = -2.965880;
	CY = (0.699530)*sailStates.alpha + (-0.023061)*sailStates.beta + (-1.370229)*sailStates.p + (1.471504)*sailStates.q + (-0.089861)*sailStates.r + (0.000310)*sailStates.de;

	Cl = (2.115716)*sailStates.alpha + (0.803668)*sailStates.beta + (-0.434977)*sailStates.p + (3.133480)*sailStates.q + (-2.580771)*sailStates.r + (-0.000964)*sailStates.de;
	Cm = (-13.794714)*sailStates.alpha + (-2.505523)*sailStates.beta + (5.047143)*sailStates.p + (-111.058342)*sailStates.q + (9.762101)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-2.739423)*sailStates.alpha + (0.034601)*sailStates.beta + (3.008661)*sailStates.p + (-14.731091)*sailStates.q + (0.029930)*sailStates.r + (-0.000616)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end