function [aeroForces] = paramSpace_4_4_3_1_3_1_2(sailStates,airStates)

	CL = (6.571000)*sailStates.alpha + (0.367855)*sailStates.beta + (-2.340064)*sailStates.p + (26.831457)*sailStates.q + (-1.695132)*sailStates.r + (0.008878)*sailStates.de;
	CD = -2.546850;
	CY = (0.163111)*sailStates.alpha + (-0.030256)*sailStates.beta + (-1.069329)*sailStates.p + (1.664522)*sailStates.q + (0.212762)*sailStates.r + (0.000351)*sailStates.de;

	Cl = (2.312811)*sailStates.alpha + (0.577492)*sailStates.beta + (-1.083667)*sailStates.p + (7.057604)*sailStates.q + (-1.763823)*sailStates.r + (0.000311)*sailStates.de;
	Cm = (-18.002428)*sailStates.alpha + (-1.391973)*sailStates.beta + (10.146943)*sailStates.p + (-136.195908)*sailStates.q + (5.465540)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (-0.922467)*sailStates.alpha + (-0.071869)*sailStates.beta + (2.579839)*sailStates.p + (-13.516376)*sailStates.q + (-0.119523)*sailStates.r + (-0.000688)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end