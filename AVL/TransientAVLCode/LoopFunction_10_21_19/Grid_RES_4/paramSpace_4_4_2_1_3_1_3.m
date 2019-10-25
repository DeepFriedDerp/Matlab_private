function [aeroForces] = paramSpace_4_4_2_1_3_1_3(sailStates,airStates)

	CL = (6.194503)*sailStates.alpha + (0.340754)*sailStates.beta + (-3.193087)*sailStates.p + (34.047394)*sailStates.q + (-1.361208)*sailStates.r + (0.009399)*sailStates.de;
	CD = -2.490490;
	CY = (-0.271604)*sailStates.alpha + (-0.027872)*sailStates.beta + (-0.978613)*sailStates.p + (1.002337)*sailStates.q + (0.194622)*sailStates.r + (0.000214)*sailStates.de;

	Cl = (2.378221)*sailStates.alpha + (0.527282)*sailStates.beta + (-1.783601)*sailStates.p + (13.792460)*sailStates.q + (-1.506823)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-16.124849)*sailStates.alpha + (-1.366628)*sailStates.beta + (12.909746)*sailStates.p + (-160.076111)*sailStates.q + (4.379145)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (0.639409)*sailStates.alpha + (-0.067534)*sailStates.beta + (2.521274)*sailStates.p + (-13.353899)*sailStates.q + (-0.131233)*sailStates.r + (-0.000508)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end