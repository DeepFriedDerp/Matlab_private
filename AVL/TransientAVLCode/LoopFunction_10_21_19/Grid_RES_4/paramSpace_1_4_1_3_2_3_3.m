function [aeroForces] = paramSpace_1_4_1_3_2_3_3(sailStates,airStates)

	CL = (3.778501)*sailStates.alpha + (0.094919)*sailStates.beta + (-2.660917)*sailStates.p + (34.893875)*sailStates.q + (-0.431450)*sailStates.r + (0.010008)*sailStates.de;
	CD = -0.021050;
	CY = (0.026859)*sailStates.alpha + (-0.024106)*sailStates.beta + (0.030478)*sailStates.p + (0.194783)*sailStates.q + (0.006041)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.207561)*sailStates.alpha + (0.006265)*sailStates.beta + (-1.296483)*sailStates.p + (10.607491)*sailStates.q + (-0.167293)*sailStates.r + (0.000530)*sailStates.de;
	Cm = (-13.900377)*sailStates.alpha + (-0.393627)*sailStates.beta + (9.336061)*sailStates.p + (-140.845245)*sailStates.q + (1.526775)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.194063)*sailStates.alpha + (0.001705)*sailStates.beta + (-0.317743)*sailStates.p + (2.230275)*sailStates.q + (-0.045395)*sailStates.r + (-0.000009)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end