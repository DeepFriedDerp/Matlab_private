function [aeroForces] = paramSpace_1_1_3_1_1_3_3(sailStates,airStates)

	CL = (6.194503)*sailStates.alpha + (0.340754)*sailStates.beta + (-3.193087)*sailStates.p + (34.047394)*sailStates.q + (1.361208)*sailStates.r + (0.009399)*sailStates.de;
	CD = -2.490490;
	CY = (0.271604)*sailStates.alpha + (-0.021700)*sailStates.beta + (0.978613)*sailStates.p + (-1.002337)*sailStates.q + (0.194622)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (2.508155)*sailStates.alpha + (-0.367651)*sailStates.beta + (-1.877990)*sailStates.p + (14.980334)*sailStates.q + (1.488089)*sailStates.r + (0.001709)*sailStates.de;
	Cm = (-16.124847)*sailStates.alpha + (-1.366628)*sailStates.beta + (12.909746)*sailStates.p + (-160.076126)*sailStates.q + (-4.379144)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-0.735545)*sailStates.alpha + (-0.110479)*sailStates.beta + (-2.540049)*sailStates.p + (13.590182)*sailStates.q + (-0.134959)*sailStates.r + (0.000508)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end