function [aeroForces] = paramSpace_4_4_4_3_2_2_1(sailStates,airStates)

	CL = (3.733777)*sailStates.alpha + (-0.220648)*sailStates.beta + (-2.209663)*sailStates.p + (32.948723)*sailStates.q + (0.889981)*sailStates.r + (0.010226)*sailStates.de;
	CD = 0.087210;
	CY = (0.000932)*sailStates.alpha + (-0.025467)*sailStates.beta + (0.210477)*sailStates.p + (0.194783)*sailStates.q + (-0.041846)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (0.977770)*sailStates.alpha + (-0.164134)*sailStates.beta + (-0.900806)*sailStates.p + (7.259106)*sailStates.q + (0.614759)*sailStates.r + (-0.000127)*sailStates.de;
	Cm = (-13.133395)*sailStates.alpha + (0.885062)*sailStates.beta + (7.286042)*sailStates.p + (-126.796555)*sailStates.q + (-3.022561)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (0.007975)*sailStates.alpha + (0.024690)*sailStates.beta + (-0.324179)*sailStates.p + (0.759542)*sailStates.q + (-0.022456)*sailStates.r + (-0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end