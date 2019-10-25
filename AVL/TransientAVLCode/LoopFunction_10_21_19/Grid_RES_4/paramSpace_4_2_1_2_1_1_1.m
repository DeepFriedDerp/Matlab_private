function [aeroForces] = paramSpace_4_2_1_2_1_1_1(sailStates,airStates)

	CL = (4.068315)*sailStates.alpha + (-0.018955)*sailStates.beta + (-1.994079)*sailStates.p + (28.429329)*sailStates.q + (-0.010373)*sailStates.r + (0.009870)*sailStates.de;
	CD = -0.269810;
	CY = (-0.020091)*sailStates.alpha + (-0.025413)*sailStates.beta + (-0.196180)*sailStates.p + (-0.455226)*sailStates.q + (0.039072)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (0.966441)*sailStates.alpha + (0.114523)*sailStates.beta + (-0.822999)*sailStates.p + (6.127452)*sailStates.q + (-0.271473)*sailStates.r + (-0.000184)*sailStates.de;
	Cm = (-15.014528)*sailStates.alpha + (0.115951)*sailStates.beta + (7.343430)*sailStates.p + (-122.911674)*sailStates.q + (0.007992)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (-0.324924)*sailStates.alpha + (-0.024442)*sailStates.beta + (0.576474)*sailStates.p + (-2.515103)*sailStates.q + (-0.028513)*sailStates.r + (0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end