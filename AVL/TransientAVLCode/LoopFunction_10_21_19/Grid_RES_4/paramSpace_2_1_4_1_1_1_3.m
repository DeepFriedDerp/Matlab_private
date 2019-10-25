function [aeroForces] = paramSpace_2_1_4_1_1_1_3(sailStates,airStates)

	CL = (5.134583)*sailStates.alpha + (-0.508511)*sailStates.beta + (-3.507354)*sailStates.p + (44.411297)*sailStates.q + (-2.211473)*sailStates.r + (0.011922)*sailStates.de;
	CD = -1.784340;
	CY = (-0.508783)*sailStates.alpha + (-0.023682)*sailStates.beta + (-0.864456)*sailStates.p + (-1.471502)*sailStates.q + (-0.056815)*sailStates.r + (-0.000320)*sailStates.de;

	Cl = (1.311878)*sailStates.alpha + (0.341348)*sailStates.beta + (-1.999578)*sailStates.p + (17.694202)*sailStates.q + (-2.005704)*sailStates.r + (0.001687)*sailStates.de;
	Cm = (-11.300719)*sailStates.alpha + (1.920047)*sailStates.beta + (11.349974)*sailStates.p + (-161.242615)*sailStates.q + (7.476864)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (1.422943)*sailStates.alpha + (0.032948)*sailStates.beta + (1.885995)*sailStates.p + (-7.142231)*sailStates.q + (0.000778)*sailStates.r + (0.000197)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end