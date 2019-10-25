function [aeroForces] = paramSpace_4_1_1_1_1_1_3(sailStates,airStates)

	CL = (4.852149)*sailStates.alpha + (-0.242763)*sailStates.beta + (-3.095741)*sailStates.p + (34.546890)*sailStates.q + (-0.518420)*sailStates.r + (0.009463)*sailStates.de;
	CD = -1.516630;
	CY = (-0.436689)*sailStates.alpha + (-0.031466)*sailStates.beta + (-0.464088)*sailStates.p + (-2.326707)*sailStates.q + (0.092563)*sailStates.r + (-0.000496)*sailStates.de;

	Cl = (1.334713)*sailStates.alpha + (0.297471)*sailStates.beta + (-1.817299)*sailStates.p + (15.151628)*sailStates.q + (-0.812646)*sailStates.r + (0.001479)*sailStates.de;
	Cm = (-14.427857)*sailStates.alpha + (1.109608)*sailStates.beta + (11.780765)*sailStates.p + (-155.326050)*sailStates.q + (1.682288)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (0.631605)*sailStates.alpha + (-0.071909)*sailStates.beta + (1.445793)*sailStates.p + (-6.026552)*sailStates.q + (-0.054815)*sailStates.r + (0.000546)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end