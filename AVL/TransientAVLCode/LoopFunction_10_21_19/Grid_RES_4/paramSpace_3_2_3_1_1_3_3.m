function [aeroForces] = paramSpace_3_2_3_1_1_3_3(sailStates,airStates)

	CL = (7.363848)*sailStates.alpha + (0.225959)*sailStates.beta + (-3.492128)*sailStates.p + (44.897938)*sailStates.q + (3.119141)*sailStates.r + (0.012024)*sailStates.de;
	CD = -3.014060;
	CY = (0.271942)*sailStates.alpha + (-0.025727)*sailStates.beta + (1.442879)*sailStates.p + (-1.915491)*sailStates.q + (-0.094639)*sailStates.r + (-0.000419)*sailStates.de;

	Cl = (3.070140)*sailStates.alpha + (-0.574066)*sailStates.beta + (-1.954728)*sailStates.p + (17.426985)*sailStates.q + (2.777346)*sailStates.r + (0.001535)*sailStates.de;
	Cm = (-14.407725)*sailStates.alpha + (-0.875031)*sailStates.beta + (11.020027)*sailStates.p + (-160.694275)*sailStates.q + (-10.557296)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (-1.529780)*sailStates.alpha + (0.044070)*sailStates.beta + (-3.058084)*sailStates.p + (14.798178)*sailStates.q + (0.026834)*sailStates.r + (0.000846)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end