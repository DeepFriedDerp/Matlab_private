function [aeroForces] = paramSpace_1_1_1_1_3_1_2(sailStates,airStates)

	CL = (7.743817)*sailStates.alpha + (-0.817745)*sailStates.beta + (-2.581071)*sailStates.p + (43.292103)*sailStates.q + (-3.669776)*sailStates.r + (0.011893)*sailStates.de;
	CD = -3.075890;
	CY = (0.257490)*sailStates.alpha + (-0.030602)*sailStates.beta + (-1.537983)*sailStates.p + (1.664522)*sailStates.q + (-0.306103)*sailStates.r + (0.000349)*sailStates.de;

	Cl = (3.082923)*sailStates.alpha + (0.455970)*sailStates.beta + (-1.224107)*sailStates.p + (12.609641)*sailStates.q + (-3.154777)*sailStates.r + (0.000343)*sailStates.de;
	Cm = (-11.784726)*sailStates.alpha + (3.125464)*sailStates.beta + (6.052557)*sailStates.p + (-131.445847)*sailStates.q + (12.139416)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (-0.317535)*sailStates.alpha + (0.153475)*sailStates.beta + (3.235316)*sailStates.p + (-14.889963)*sailStates.q + (0.064354)*sailStates.r + (-0.000710)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end