function [aeroForces] = paramSpace_2_4_4_1_1_1_3(sailStates,airStates)

	CL = (5.134583)*sailStates.alpha + (0.508511)*sailStates.beta + (-3.507354)*sailStates.p + (44.411285)*sailStates.q + (-2.211473)*sailStates.r + (0.011922)*sailStates.de;
	CD = -1.784340;
	CY = (-0.508783)*sailStates.alpha + (-0.025890)*sailStates.beta + (-0.864456)*sailStates.p + (-1.471502)*sailStates.q + (-0.056815)*sailStates.r + (-0.000320)*sailStates.de;

	Cl = (1.207556)*sailStates.alpha + (0.632750)*sailStates.beta + (-1.901875)*sailStates.p + (16.485638)*sailStates.q + (-1.999428)*sailStates.r + (0.001423)*sailStates.de;
	Cm = (-11.300719)*sailStates.alpha + (-1.920047)*sailStates.beta + (11.349974)*sailStates.p + (-161.242615)*sailStates.q + (7.476866)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (1.287193)*sailStates.alpha + (0.030897)*sailStates.beta + (1.892399)*sailStates.p + (-7.221444)*sailStates.q + (0.001189)*sailStates.r + (0.000197)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end