function [aeroForces] = paramSpace_1_1_2_2_1_2_1(sailStates,airStates)

	CL = (6.389708)*sailStates.alpha + (0.287722)*sailStates.beta + (-2.526999)*sailStates.p + (31.026079)*sailStates.q + (-0.257942)*sailStates.r + (0.009194)*sailStates.de;
	CD = -2.509540;
	CY = (1.548102)*sailStates.alpha + (-0.049028)*sailStates.beta + (-0.422508)*sailStates.p + (12.630248)*sailStates.q + (-0.054730)*sailStates.r + (0.002686)*sailStates.de;

	Cl = (0.178430)*sailStates.alpha + (-0.313982)*sailStates.beta + (-1.384979)*sailStates.p + (11.925347)*sailStates.q + (0.311953)*sailStates.r + (0.000500)*sailStates.de;
	Cm = (-15.412831)*sailStates.alpha + (-1.448196)*sailStates.beta + (8.768072)*sailStates.p + (-136.049576)*sailStates.q + (0.691062)*sailStates.r + (-0.068195)*sailStates.de;
	Cn = (-1.527861)*sailStates.alpha + (-0.019444)*sailStates.beta + (0.406950)*sailStates.p + (-10.653481)*sailStates.q + (0.117085)*sailStates.r + (-0.003601)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end