function [aeroForces] = paramSpace_2_3_2_1_3_1_3(sailStates,airStates)

	CL = (7.363848)*sailStates.alpha + (0.225959)*sailStates.beta + (-3.492128)*sailStates.p + (44.897938)*sailStates.q + (-3.119140)*sailStates.r + (0.012024)*sailStates.de;
	CD = -3.014060;
	CY = (-0.271942)*sailStates.alpha + (-0.024226)*sailStates.beta + (-1.442879)*sailStates.p + (1.915491)*sailStates.q + (-0.094639)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (3.035073)*sailStates.alpha + (0.712591)*sailStates.beta + (-1.922079)*sailStates.p + (17.023111)*sailStates.q + (-2.775192)*sailStates.r + (0.001446)*sailStates.de;
	Cm = (-14.407722)*sailStates.alpha + (-0.875030)*sailStates.beta + (11.020028)*sailStates.p + (-160.694275)*sailStates.q + (10.557295)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (1.471058)*sailStates.alpha + (0.040262)*sailStates.beta + (3.060224)*sailStates.p + (-14.824649)*sailStates.q + (0.026975)*sailStates.r + (-0.000846)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end